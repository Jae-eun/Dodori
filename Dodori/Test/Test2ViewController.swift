//
//  Test2ViewController.swift
//  Dodori
//
//  Created by SWUCOMPUTER on 2018. 6. 8..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

/*
 * Copyright 2016 NAVER Corp.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
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
import UIKit


final class Test2ViewController: UIViewController, AVAudioPlayerDelegate {
    // MARK:- Properties
    var audioPlayer: AVAudioPlayer?
    var audioPlayer2: AVAudioPlayer?
    var audioPlayer3: AVAudioPlayer?
    
    // MARK: IBOutlets
    @IBOutlet var playPauseButton: UIButton!
  
    @IBOutlet weak var step2Image: UIImageView!
    @IBOutlet weak var step2Sentence: UILabel!
    @IBOutlet weak var step2Pronun: UILabel!
    @IBOutlet weak var pageNum: UIImageView!
    @IBOutlet weak var dodoriSpeakingImageView: UIImageView!
    
    @IBOutlet weak var heart: UIImageView!
    @IBOutlet weak var heart2: UIImageView!
    @IBOutlet weak var heart3: UIImageView!
    @IBOutlet weak var grayHeart: UIImageView!
    @IBOutlet weak var grayHeart2: UIImageView!
    @IBOutlet weak var grayHeart3: UIImageView!

    
    var pageNumber: Int = 0
    var testData: String = ""
    public var animationView = LOTAnimationView()
    public var animationView1 = LOTAnimationView()
    public var animationView2 = LOTAnimationView()
    var soundName: String = ""
    var effectSoundName: String = ""
    var bubbleSoundName: String = ""
    var step2FileName: String = ""
    var isSolve: Bool = false
    var isCorrect: Bool = false

    // 메인화면으로 이동
    @IBAction func goHome(_ sender: Any) {
        pressedBtn()
        self.testDataDefault()
        ViewData.shared.selectedReview = nil
        self.navigationController?.popToRootViewController(animated: false)
    }
    
    
    func receiveData() {
        if ViewData.shared.selectedStory == "tino" {
            if ViewData.shared.selectedLevel == "easy" {
                testData = "tinoEasy"
            }
            else if ViewData.shared.selectedLevel == "hard" {
                testData = "tinoHard"
            }
        }
        else if ViewData.shared.selectedStory == "yagu" {
            if ViewData.shared.selectedLevel == "easy" {
                testData = "yaguEasy"
            }
            else if ViewData.shared.selectedLevel == "hard" {
                testData = "yaguHard"
            }
        }
        else if ViewData.shared.selectedStory == "paul" {
            if ViewData.shared.selectedLevel == "easy" {
                testData = "paulEasy"
            }
            else if ViewData.shared.selectedLevel == "hard" {
                testData = "paulHard"
            }
        }
    }
    
    
    func testDataDefault() {
        heart.isHidden = false
        heart2.isHidden = false
        heart3.isHidden = false
        grayHeart.isHidden = true
        grayHeart2.isHidden = true
        grayHeart3.isHidden = true
        
        dodoriSpeakingImageView.isHidden = false
//        dodoriSpeakingImageView.image = UIImage(named: "training_stage2_tell1")
        
        Test2Data.shared.opportunity = 3
        recognitionResultLabel.text = nil
        
        isSolve = false
    }
    
    
    func sendData() {
        let pageNumImg: String = Test2Data.shared.pageNum[pageNumber]
        pageNum.image = UIImage(named: pageNumImg)
        
        if testData == "tinoEasy" {
            step2FileName = Test2Data.shared.tinoEasyFileName[pageNumber]
            step2Image.image = UIImage(named: step2FileName)
            step2Sentence.text = Test2Data.shared.tinoEasyTextArray[pageNumber]
            step2Pronun.text = Test2Data.shared.tinoEasyPronunArray[pageNumber]
        }
        else if testData == "tinoHard" {
            step2FileName = Test2Data.shared.tinoHardFileName[pageNumber]
            step2Image.image = UIImage(named: step2FileName)
            step2Sentence.text = Test2Data.shared.tinoHardTextArray[pageNumber]
            step2Pronun.text = Test2Data.shared.tinoHardPronunArray[pageNumber]
        }
        if testData == "yaguEasy" {
            step2FileName = Test2Data.shared.yaguEasyFileName[pageNumber]
            step2Image.image = UIImage(named: step2FileName)
            step2Sentence.text = Test2Data.shared.yaguEasyTextArray[pageNumber]
            step2Pronun.text = Test2Data.shared.yaguEasyPronunArray[pageNumber]
        }
        else if testData == "yaguHard" {
            step2FileName = Test2Data.shared.yaguHardFileName[pageNumber]
            step2Image.image = UIImage(named: step2FileName)
            step2Sentence.text = Test2Data.shared.yaguHardTextArray[pageNumber]
            step2Pronun.text = Test2Data.shared.yaguHardPronunArray[pageNumber]
        }
        else if testData == "paulEasy" {
            step2FileName = Test2Data.shared.paulEasyFileName[pageNumber]
            step2Image.image = UIImage(named: step2FileName)
            step2Sentence.text = Test2Data.shared.paulEasyTextArray[pageNumber]
            step2Pronun.text = Test2Data.shared.paulEasyPronunArray[pageNumber]
        }
        else if testData == "paulHard" {
            step2FileName = Test2Data.shared.paulHardFileName[pageNumber]
            step2Image.image = UIImage(named: step2FileName)
            step2Sentence.text = Test2Data.shared.paulHardTextArray[pageNumber]
            step2Pronun.text = Test2Data.shared.paulHardPronunArray[pageNumber]
        }
    }
    

    public func heartAnimation () {
        let animationView = LOTAnimationView(name: "heart_anim")
        self.removeHeart()

        if Test2Data.shared.opportunity == 2 {
            animationView.frame = CGRect(x: 745, y: 165, width: 55, height: 50)
            self.view.addSubview(animationView)
            animationView.play(completion: {(true) in
                self.grayHeart.isHidden = false;
                self.bubbleLottie() })
            heart.isHidden = true
        }
        else if Test2Data.shared.opportunity == 1 {
            animationView.frame = CGRect(x: 806, y: 165, width: 55, height: 50)
            self.view.addSubview(animationView)
            animationView.play(completion: {(true) in
                self.grayHeart2.isHidden = false;
                self.bubbleLottie2() })
            heart2.isHidden = true
        }
        else if Test2Data.shared.opportunity == 0 {
            Test2Data.shared.reviewPageNum.append(pageNumber)
            animationView.frame = CGRect(x: 867, y: 165, width: 55, height: 50)
            self.view.addSubview(animationView)
            animationView.play(completion: {(true) in
                self.grayHeart3.isHidden = false;
                self.incorrectPopUp() })
            heart3.isHidden = true
        }
    }

    public func addReviewPageNum() {
        if testData == "tinoEasy" {
            ReviewData.shared.tinoEasySentenceReview = Test2Data.shared.reviewPageNum
        }
        else if testData == "tinoHard" {
            ReviewData.shared.tinoHardSentenceReview = Test2Data.shared.reviewPageNum
        }
        else if testData == "yaguEasy" {
            ReviewData.shared.yaguEasySentenceReview = Test2Data.shared.reviewPageNum
        }
        else if testData == "yaguHard" {
            ReviewData.shared.yaguHardSentenceReview = Test2Data.shared.reviewPageNum
        }
        else if testData == "paulEasy" {
            ReviewData.shared.paulEasySentenceReview = Test2Data.shared.reviewPageNum
        }
        else if testData == "paulHard" {
            ReviewData.shared.paulHardSentenceReview = Test2Data.shared.reviewPageNum
        }
    }
    
    func intro() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let storyboardId = self.restorationIdentifier else { return }
        
        guard let vc =
            storyboard.instantiateViewController(withIdentifier: "IntroView") as? IntroViewController else { return }
        
        vc.testIntroDelegate = self
        vc.storyBoardId = storyboardId
        vc.soundName = PopUpData.shared.changeIntroSound(storyBoardId: storyboardId)
        vc.speakingImageName = ViewData.shared.changeImage(storyBoardId: storyboardId)
        vc.view.backgroundColor = UIColor(white: 0, alpha: 0.75)
        vc.modalPresentationStyle = .overCurrentContext
        
        self.present(vc, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dodoriSpeakingImageView.isHidden = true
        intro()
        Test2Data.shared.reviewPageNum = []

        audioPlayer?.prepareToPlay()
        audioPlayer2?.prepareToPlay()
        audioPlayer3?.prepareToPlay()
        
        receiveData()
        sendData()
    }
    
    // MARK: - Methods
    // MARK: - Custom Method
    func initializePlayer() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: soundName) else {
            print("음원 파일 에셋을 가져올 수 없습니다")
            return
        }
        do {
            try self.audioPlayer = AVAudioPlayer(data: soundAsset.data)
            self.audioPlayer?.delegate = self
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
            try self.audioPlayer2 = AVAudioPlayer(data: soundAsset.data)
            self.audioPlayer2?.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
    }
    
    func bubbleSoundPlayer() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: bubbleSoundName) else {
            print("음원 파일 에셋을 가져올 수 없습니다")
            return
        }
        do {
            try self.audioPlayer3 = AVAudioPlayer(data: soundAsset.data)
            self.audioPlayer3?.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
    }
    
    func pressedPronunciation() {
        soundName = "\(step2FileName)_sound"
        initializePlayer()
    }
    
    func pressedBtn() {
        soundName = "1.app-button"
        effectSoundPlayer()
        self.audioPlayer?.play()
    }
    
    func pressedRecordBtn() {
        soundName = "5.app-record_start"
        effectSoundPlayer()
        self.audioPlayer?.play()
    }
    
//    func finishedRecordBtn() {
//        soundName = "5.app-record_end"
//        initializePlayer()
//        self.audioPlayer?.play()
//    }
    
    func playBubbleSound() {
        if Test2Data.shared.opportunity == 3 {
            bubbleSoundName = "dodori_sentence"
        } else if Test2Data.shared.opportunity == 2 {
            bubbleSoundName = "dodori_wrong"
        } else if Test2Data.shared.opportunity == 1 {
            bubbleSoundName = "dodori_one_heart"
        }
        bubbleSoundPlayer()
        self.audioPlayer3?.play()
    }
    
    func removeHeart() {
        soundName = "7.app-heart"
        initializePlayer()
        self.audioPlayer?.play()
    }

    
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton) {
        pressedPronunciation()
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            self.audioPlayer?.play()
        } else {
            self.audioPlayer?.pause()
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
     * Auto mode는 화자의 발화가 일정시간 이상 지속되지 않으면 자동으로 끝점을 인식하여 음성인식이 종료됩니다.
     * 이 sample app에서는 button으로 음성인식을 시작하고 끝내게 됩니다.
     * 인식기가 동작 중일 때 button에 대한 tap action이 들어오면 인식기를 중지 시킵니다.
     * 인식기가 동작 중이지 않을 때 button에 대한 tap action이 들어오면 인식기에 언어 코드를 넣어서 인식기를 시작시킵니다.
     */
    @IBAction func recognitionButtonTapped(_ sender: Any) {
        isSolve = true
        pressedRecordBtn()
        if self.speechRecognizer.isRunning {
            self.speechRecognizer.stop()

        } else {
            try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryRecord)
            self.speechRecognizer.start(with: .korean)
            self.recognitionButton.isEnabled = false
            recognitionButton.isSelected = true
            recognitionButton.setImage(UIImage(named : "voice_c_Btn"), for: UIControlState.normal)
        }
    }
    
    // MARK: - property
    @IBOutlet weak var recognitionResultLabel: UILabel!
    @IBOutlet weak var recognitionButton: UIButton!
    
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
extension Test2ViewController: NSKRecognizerDelegate {
    
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
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
            self.heartAnimation()
        }
    }
    
    public func recognizer(_ aRecognizer: NSKRecognizer!, didReceive aResult: NSKRecognizedResult!) {
        
        
        if var result = aResult.results.first as? String {
            result = result.trimmingCharacters(in: ["?"])
            print("Final result: \(aResult)")
            self.recognitionResultLabel.text = result
            let text = step2Sentence.text!
            if text != result {
                Test2Data.shared.opportunity -= 1
                isCorrect = false
                self.recognitionResultLabel.textColor = redcolor
                
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
    
    func setRecognitionButtonTitle(withText text: String, color: UIColor) {
        recognitionButton.setTitle(text, for: .normal)
        recognitionButton.setTitleColor(color, for: .normal)
    }
    
    func incorrectPopUp() {
        guard let storyboardId = self.restorationIdentifier else { return }
        
        guard let vc =
            storyboard?.instantiateViewController(withIdentifier: "IncorrectPopUpView") as? IncorrectPopUpViewController else { return }
        
        vc.delegate = self
        vc.storyboardID = storyboardId
        vc.soundName = PopUpData.shared.changeIncorrectSound(storyBoardId: storyboardId)
        vc.view.backgroundColor = UIColor(white: 0, alpha: 0.75)
        vc.modalPresentationStyle = .overCurrentContext
        
        self.present(vc, animated: false, completion: nil)
    }
    
    func playCorrectLottieSound() {
        effectSoundPlayer()
        self.audioPlayer2?.play()
    }
    
    func correctLottie() {
        let randomNo: UInt32 = arc4random_uniform(5) + 1;
        let correctIconImageName = "correct_icon\(randomNo)"
        animationView = LOTAnimationView(name: correctIconImageName)
        effectSoundName = "dodori_stamp\(randomNo)"
        animationView.frame = CGRect(x: 0, y: 0, width: 1024, height: 768)
        self.view.addSubview(animationView)
        self.playCorrectLottieSound()
        animationView.play(completion: {(true) in self.nextPage()})
    }
    
    func bubbleLottie() {
        playBubbleSound()
        dodoriSpeakingImageView.isHidden = true
        animationView1 = LOTAnimationView(name: "bubble_stage1,2_3")
        animationView1.frame = CGRect(x: 175, y: 50, width: 336, height: 60)
        self.view.addSubview(animationView1)
        animationView1.play()
    }
    
    func bubbleLottie2() {
        playBubbleSound()
        dodoriSpeakingImageView.isHidden = true
        animationView2 = LOTAnimationView(name: "bubble_stage1,2_2")
        animationView2.frame = CGRect(x: 175, y: 50, width: 418, height: 60)
        self.view.addSubview(animationView2)
        animationView2.play()
    }
}

extension Test2ViewController: IncorrectPopUpDelegate {
    func playAuto() {
        
    }
    
    @IBAction func nextPage() {
        if isSolve == true {
            ResultData.shared.totalOpportunityScore += 3
            ResultData.shared.solvedOpportunityScore += Test2Data.shared.opportunity
        }
        pageNumber += 1;
        self.audioPlayer?.pause()
        self.audioPlayer2?.pause()
        self.audioPlayer3?.pause()
        
        if pageNumber == 10 {
            addReviewPageNum()
            // 화면 전환할 뷰 컨트롤러를 Storyboard ID 정보를 이용, 읽어와서 객체로 생성함
            if let view = self.storyboard?.instantiateViewController(withIdentifier: "QuizView") {
                // 화면을 전환함
                self.navigationController?.pushViewController(view, animated: false)
            }
        }
        else {

            animationView.removeFromSuperview()
            animationView1.removeFromSuperview()
            animationView2.removeFromSuperview()
            self.testDataDefault()
            self.sendData()
        }
    }
}

extension Test2ViewController: TestIntroDelegate {
    func bubbleDefaultLottie() {
        playBubbleSound()
        animationView = LOTAnimationView(name: "bubble_stage2")
        animationView.frame = CGRect(x: 175, y: 50, width: 295, height: 60)
        self.view.addSubview(animationView)
        animationView.play()
    }
}
