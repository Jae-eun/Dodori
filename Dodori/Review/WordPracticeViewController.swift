//
//  Test1ReviewViewController.swift
//  Dodori
//
//  Created by 이재은 on 2018. 9. 4..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
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


class Test1ReviewViewController: UIViewController, AVAudioPlayerDelegate {
    
    // MARK: IBOutlets
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet weak var step1ReviewImageView: UIImageView!
    @IBOutlet weak var step1ReviewWordLabel: UILabel!
    @IBOutlet weak var step1ReviewPronunciationLabel: UILabel!
    @IBOutlet weak var recognitionResultLabel: UILabel!
    @IBOutlet weak var recognitionButton: UIButton!
    
    // MARK:- Properties
    var player: AVAudioPlayer?
    var pageNumber: Int = 0
    var testData: String = ""
    var reviewPageNum: Array<Int>?
    var soundName: String = ""
    var step1ReviewImageName: String = ""
    public var animationView = LOTAnimationView()
    
//    func getContext() -> NSManagedObjectContext {
//        let appDelegate = UIApplication.shared.delegate as? AppDelegate
//        return appDelegate?.persistentContainer.viewContext
//    }

    
    // 메인화면으로 이동
    @IBAction func goHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: false)
        ViewData.shared.selectedReview = nil
    }
    
    
    func receiveData() {
//        if ViewData.shared.selectedStory == "tino" {
//            if ViewData.shared.selectedLevel == "easy" {
//                testData = "tinoEasy"
//            }
//            else if ViewData.shared.selectedLevel == "hard" {
//                testData = "tinoHard"
//            }
//        }
//        else if ViewData.shared.selectedStory == "yagu" {
//            if ViewData.shared.selectedLevel == "easy" {
//                testData = "yaguEasy"
//            }
//            else if ViewData.shared.selectedLevel == "hard" {
//                testData = "yaguHard"
//            }
//        }
//        else if ViewData.shared.selectedStory == "paul" {
//            if ViewData.shared.selectedLevel == "easy" {
//                testData = "paulEasy"
//            }
//            else if ViewData.shared.selectedLevel == "hard" {
//                testData = "paulHard"
//            }
//        }
    }
    
    func testDataDefault() {
        recognitionResultLabel.text = nil
    }
    
    func sendData() {
//        self.testDataDefault()
//
        if testData == "tinoEasy" {
            step1ReviewImageName = Test1Data.shared.tinoEasyFileName[pageNumber]
            step1ReviewImageView.image = UIImage(named: step1ReviewImageName)
            step1ReviewWordLabel.text = Test1Data.shared.tinoEasyTextArray[pageNumber]
            step1ReviewPronunciationLabel.text = Test1Data.shared.tinoEasyPronunArray[pageNumber]
        }
        else if testData == "tinoHard" {
            step1ReviewImageName = Test1Data.shared.tinoHardFileName[pageNumber]
            step1ReviewImageView.image = UIImage(named: step1ReviewImageName)
            step1ReviewWordLabel.text = Test1Data.shared.tinoHardTextArray[pageNumber]
            step1ReviewPronunciationLabel.text = Test1Data.shared.tinoHardPronunArray[pageNumber]
        }
        else if testData == "yaguEasy" {
            step1ReviewImageName = Test1Data.shared.yaguEasyFileName[pageNumber]
            step1ReviewImageView.image = UIImage(named: step1ReviewImageName)
            step1ReviewWordLabel.text = Test1Data.shared.yaguEasyTextArray[pageNumber]
            step1ReviewPronunciationLabel.text = Test1Data.shared.yaguEasyPronunArray[pageNumber]
        }
        else if testData == "yaguHard" {
            step1ReviewImageName = Test1Data.shared.yaguHardFileName[pageNumber]
            step1ReviewImageView.image = UIImage(named: step1ReviewImageName)
            step1ReviewWordLabel.text = Test1Data.shared.yaguHardTextArray[pageNumber]
            step1ReviewPronunciationLabel.text = Test1Data.shared.yaguHardPronunArray[pageNumber]
        }
        else if testData == "paulEasy" {
            step1ReviewImageName = Test1Data.shared.yaguEasyFileName[pageNumber]
            step1ReviewImageView.image = UIImage(named: step1ReviewImageName)
            step1ReviewWordLabel.text = Test1Data.shared.yaguEasyTextArray[pageNumber]
            step1ReviewPronunciationLabel.text = Test1Data.shared.yaguEasyPronunArray[pageNumber]
        }
        else if testData == "paulHard" {
            step1ReviewImageName = Test1Data.shared.yaguHardFileName[pageNumber]
            step1ReviewImageView.image = UIImage(named: step1ReviewImageName)
            step1ReviewWordLabel.text = Test1Data.shared.yaguHardTextArray[pageNumber]
            step1ReviewPronunciationLabel.text = Test1Data.shared.yaguHardPronunArray[pageNumber]
        }
    }
    
    
    
    // MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
//        self.receiveData()
//        self.sendData()
        
        player?.prepareToPlay()
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
    
    
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton) {
        
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
extension Test1ReviewViewController: NSKRecognizerDelegate {
    
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
        self.recognitionResultLabel.text = "Error: " + aError.localizedDescription
        
        if self.speechRecognizer.isRunning {
            self.speechRecognizer.cancel()
            self.recognitionResultLabel.text = "Canceled"
            self.recognitionButton.isEnabled = true
            try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategorySoloAmbient)
        }
    }
    
    public func recognizer(_ aRecognizer: NSKRecognizer!, didReceive aResult: NSKRecognizedResult!) {
        print("Final result: \(aResult)")
        
        if let result = aResult.results.first as? String {
            self.recognitionResultLabel.text = result
            if step1ReviewWordLabel.text != result {
                self.recognitionResultLabel.textColor = redcolor
                self.recognitionResultLabel.text = result
                
            } else {
                self.recognitionResultLabel.textColor = bluecolor
                self.recognitionResultLabel.text = result
            }
            recognitionButton.isSelected = false
            recognitionButton.setImage(UIImage(named : "voiceBtn"), for: UIControlState.normal)
            
        }
        
    }
    
    func playCorrectLottieSound() {
        initializePlayer()
        self.player?.play()
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
        animationView.play(completion: {(true) in self.playCorrectLottieSound()})
    }
}

