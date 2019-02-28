//
//  SentencePracticeViewController.swift
//  Dodori
//
//  Created by 이재은 on 27/10/2018.
//  Copyright © 2018 SWUCOMPUTER. All rights reserved.
//

/* you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIKit
import NaverSpeech
import AVFoundation
import Lottie
import CoreData

class SentencePracticeViewController: UIViewController, AVAudioPlayerDelegate {

    // MARK: IBOutlets
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet weak var step2ReviewImageView: UIImageView!
    @IBOutlet weak var step2ReviewWordLabel: UILabel!
    @IBOutlet weak var step2ReviewPronunciationLabel: UILabel!
    @IBOutlet weak var recognitionResultLabel: UILabel!
    @IBOutlet weak var recognitionButton: UIButton!
    @IBOutlet weak var dodoriSpeakingImageView: UIImageView!
    
    // MARK:- Properties
    var player: AVAudioPlayer?
    var player2: AVAudioPlayer?
    var pageNumber: Int = ReviewData.shared.pageNumber ?? 0
    var testData: String = ReviewData.shared.testData ?? "yaguEasy"
    var soundName: String = ""
    var effectSoundName: String = ""
    var step2ReviewFileName: String = ""
    public var animationView = LOTAnimationView()
    var isCorrect: Bool = false
    //    func getContext() -> NSManagedObjectContext {
    //        let appDelegate = UIApplication.shared.delegate as? AppDelegate
    //        return appDelegate?.persistentContainer.viewContext
    //    }

    // 메인화면으로 이동
    @IBAction func goHome(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
        //        ViewData.shared.selectedReview = nil
    }

    func sendData() {

        if testData == "tinoEasy" {
            step2ReviewFileName = Test2Data.shared.tinoEasyFileName[pageNumber]
            step2ReviewImageView.image = UIImage(named: step2ReviewFileName)
            step2ReviewWordLabel.text = Test2Data.shared.tinoEasyTextArray[pageNumber]
            step2ReviewPronunciationLabel.text = Test2Data.shared.tinoEasyPronunArray[pageNumber]
        }
        else if testData == "tinoHard" {
            step2ReviewFileName = Test2Data.shared.tinoHardFileName[pageNumber]
            step2ReviewImageView.image = UIImage(named: step2ReviewFileName)
            step2ReviewWordLabel.text = Test2Data.shared.tinoHardTextArray[pageNumber]
            step2ReviewPronunciationLabel.text = Test2Data.shared.tinoHardPronunArray[pageNumber]
        }
        else if testData == "yaguEasy" {
            step2ReviewFileName = Test2Data.shared.yaguEasyFileName[pageNumber]
            step2ReviewImageView.image = UIImage(named: step2ReviewFileName)
            step2ReviewWordLabel.text = Test2Data.shared.yaguEasyTextArray[pageNumber]
            step2ReviewPronunciationLabel.text = Test2Data.shared.yaguEasyPronunArray[pageNumber]
        }
        else if testData == "yaguHard" {
            step2ReviewFileName = Test2Data.shared.yaguHardFileName[pageNumber]
            step2ReviewImageView.image = UIImage(named: step2ReviewFileName)
            step2ReviewWordLabel.text = Test2Data.shared.yaguHardTextArray[pageNumber]
            step2ReviewPronunciationLabel.text = Test2Data.shared.yaguHardPronunArray[pageNumber]
        }
        else if testData == "paulEasy" {
            step2ReviewFileName = Test2Data.shared.paulEasyFileName[pageNumber]
            step2ReviewImageView.image = UIImage(named: step2ReviewFileName)
            step2ReviewWordLabel.text = Test2Data.shared.paulEasyTextArray[pageNumber]
            step2ReviewPronunciationLabel.text = Test2Data.shared.paulEasyPronunArray[pageNumber]
        }
        else if testData == "paulHard" {
            step2ReviewFileName = Test2Data.shared.paulHardFileName[pageNumber]
            step2ReviewImageView.image = UIImage(named: step2ReviewFileName)
            step2ReviewWordLabel.text = Test2Data.shared.paulHardTextArray[pageNumber]
            step2ReviewPronunciationLabel.text = Test2Data.shared.paulHardPronunArray[pageNumber]
        }
    }
    
    
    
    // MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()

        self.sendData()
        
        player?.prepareToPlay()
        player2?.prepareToPlay()
    }

    
    // MARK: - Methods
    // MARK: - Custom Method
    func initializePlayer() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: soundName) else {
            print("음원 파일 에셋을 가져올 수 없습니다")
            return
        }
        
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player?.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
    }
    
    func effectSoundPlayer() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: effectSoundName) else {
            print("음원 파일 에셋을 가져올 수 없습니다")
            return
        }
        
        do {
            try self.player2 = AVAudioPlayer(data: soundAsset.data)
            self.player2?.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
    }
    
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton) {
        pressedPronunciation()
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            self.player?.play()
        } else {
            self.player?.pause()
        }
    }
    
    
    // MARK: AVAudioPlayerDelegate
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        guard let error: Error = error else {
            print("오디오 플레이어 디코드 오류발생")
            return
        }
        
        let message: String
        message = "오디오 플레이어 오류 발생 \(error.localizedDescription)"
        
        let alert: UIAlertController = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default) { (action: UIAlertAction) -> Void in
            
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func audioPlayerDidFinishPlaying(_ Player: AVAudioPlayer, successfully flag: Bool) {
        self.playPauseButton.isSelected = false
    }
    

    
    // MARK: - init
    required init?(coder aDecoder: NSCoder) {
        /*
         *  NSKRecognizer를 초기화 하는데 필요한 NSKRecognizerConfiguration을 생성합니다.
         *  configuration의 EPD(End Point Detection)type의 default값은 auto 이므로 여기에서 따로 값을 setting하지 않아도 됩니다.
         */
        let configuration = NSKRecognizerConfiguration(clientID: ClientID)
        configuration?.canQuestionDetected = true
        self.speechRecognizer = NSKRecognizer(configuration: configuration)
        super.init(coder: aDecoder)
        
        self.speechRecognizer.delegate = self
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        if self.isViewLoaded && self.view.window == nil {
            self.view = nil
        }
    }
    
    /*
     * Auto mode는 play_d_Btn.png화자의 발화가 일정시간 이상 지속되지 않으면 자동으로 끝점을 인식하여 음성인식이 종료됩니다.
     * 이 sample app에서는 button으로 음성인식을 시작하고 끝내게 됩니다.
     * 인식기가 동작 중일 때 button에 대한 tap action이 들어오면 인식기를 중지 시킵니다.
     * 인식기가 동작 중이지 않을 때 button에 대한 tap action이 들어오면 인식기에 언어 코드를 넣어서 인식기를 시작시킵니다.
     */
    @IBAction func recognitionButtonTapped(_ sender: Any) {
        if self.speechRecognizer.isRunning {
            self.speechRecognizer.stop()
            recognitionButton.isSelected = false
            recognitionButton.setImage(UIImage(named : "voiceBtn"), for: UIControlState.normal)
        } else {
            try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryRecord)
            self.speechRecognizer.start(with: .korean)
            self.recognitionButton.isEnabled = false
            recognitionButton.isSelected = true
            recognitionButton.setImage(UIImage(named : "voice_c_Btn"), for: UIControlState.normal)
        }
    }
    
    fileprivate let speechRecognizer: NSKRecognizer
    fileprivate let languages = Languages()
    
    
    var finalResult = Array<String>()
    var result = ""
    let redcolor = UIColor(red: 1,
                           green: 0,
                           blue: 0,
                           alpha: 1)
    
    let bluecolor = UIColor(red: 0,
                            green: 0,
                            blue: 1,
                            alpha: 1)
    
    let blackcolor = UIColor(red: 0,
                             green: 0,
                             blue: 0,
                             alpha: 1)
}


/*
 * NSKRecognizerDelegate protocol 구현부
 */
extension SentencePracticeViewController: NSKRecognizerDelegate {
    
    public func recognizerDidEnterReady(_ aRecognizer: NSKRecognizer!) {
        print("Event occurred: Ready")
        self.recognitionResultLabel.textColor = blackcolor
        self.recognitionResultLabel.text = "발음해보세요"
        self.recognitionButton.isEnabled = true
    }
    
    public func recognizerDidDetectEndPoint(_ aRecognizer: NSKRecognizer!) {
        print("Event occurred: End point detected")
    }
    
    public func recognizerDidEnterInactive(_ aRecognizer: NSKRecognizer!) {
        print("Event occurred: Inactive")
        
        self.recognitionButton.isEnabled = true
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategorySoloAmbient)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.correctPronunciation()
        }
    }
    
    public func recognizer(_ aRecognizer: NSKRecognizer!, didRecordSpeechData aSpeechData: Data!) {
        print("Record speech data, data size: \(aSpeechData.count)")
        
    }
    
    public func recognizer(_ aRecognizer: NSKRecognizer!, didReceivePartialResult aResult: String!) {
        print("Partial result: \(aResult)")
        self.recognitionResultLabel.text = "목소리를 듣고 있어요"
    }
    
    public func recognizer(_ aRecognizer: NSKRecognizer!, didReceiveError aError: Error!) {
        print("Error: \(aError)")
        
        // self.setRecognitionButtonTitle(withText: "Record", color: .blue)
        self.recognitionButton.isEnabled = true
        print("Error: " + aError.localizedDescription)
        self.recognitionResultLabel.text = "마이크 버튼을 다시 누르세요"
        
        if self.speechRecognizer.isRunning {
            self.speechRecognizer.cancel()
//            self.recognitionResultLabel.text = "Canceled"
            self.recognitionButton.isEnabled = true
            try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategorySoloAmbient)
        }
    }
    
    func correctPronunciation() {
        if isCorrect == true {
            self.correctLottie()
        } else {
            self.bubbleLottie()
        }
    }

    public func recognizer(_ aRecognizer: NSKRecognizer!, didReceive aResult: NSKRecognizedResult!) {
        print("Final result: \(aResult)")
        
        if var result = aResult.results.first as? String {
            result = result.trimmingCharacters(in: ["?"])
            self.recognitionResultLabel.text = result
            let text = step2ReviewWordLabel.text!
            if text != result {
                self.recognitionResultLabel.textColor = redcolor
                isCorrect = false
                
                var textIndex: DefaultIndices<String.CharacterView>
                var incorrectRange: [NSRange] = []
                
                if result.count > text.count {
                    textIndex = text.characters.indices
                } else {
                    textIndex = result.characters.indices
                }
                
                for index in textIndex {
                    if result[index] == text[index] {
                        let range = (result as NSString).range(of: String(result[index]))
                        incorrectRange.append(range)
                        let attributedString = NSMutableAttributedString(string: result)
                        
                        for i in 0 ..< incorrectRange.count {
                            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.blue, range: incorrectRange[i])
                        }
                        recognitionResultLabel.attributedText = attributedString
                    }
                }
            } else {
                self.recognitionResultLabel.textColor = bluecolor
                self.recognitionResultLabel.text = result
                isCorrect = true
            }
            recognitionButton.isSelected = false
            recognitionButton.setImage(UIImage(named : "voiceBtn"), for: UIControlState.normal)
        }
    }
    
    func pressedBtn() {
        soundName = "1.app-button"
        effectSoundPlayer()
        self.player2?.play()
    }
    
    func pressedPronunciation() {
        soundName = "\(step2ReviewFileName)_sound"
        initializePlayer()
    }
    
    func playCorrectLottieSound() {
        effectSoundPlayer()
        self.player2?.play()
    }
    
    func playBubbleSound() {
        soundName = "dodori_wrong"
        effectSoundPlayer()
        self.player2?.play()
    }
    
    func correctLottie() {
        let randomNo: UInt32 = arc4random_uniform(5) + 1;
        let correctIconImageName = "correct_icon\(randomNo)"
        print(correctIconImageName)
        soundName = "dodori_stamp\(randomNo)"
        print(soundName)
        animationView = LOTAnimationView(name: correctIconImageName)
        animationView.frame = CGRect(x: 0, y: 0, width: 1024, height: 768)
        self.view.addSubview(animationView)
        animationView.play(completion: {(true) in self.playCorrectLottieSound(); self.animationView.removeFromSuperview()})
    }
    
    func bubbleLottie() {
        playBubbleSound()
        dodoriSpeakingImageView.isHidden = true
        animationView = LOTAnimationView(name: "bubble_stage1,2_3")
        animationView.frame = CGRect(x: 175, y: 50, width: 336, height: 60)
        self.view.addSubview(animationView)
        animationView.play()
    }
}

