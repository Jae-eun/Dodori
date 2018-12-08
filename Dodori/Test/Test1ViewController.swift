//
//  Test1ViewController.swift
//  Dodori
//
//  Created by SWUCOMPUTER on 2018. 5. 16..
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
// import Common
import AVFoundation
import Lottie
import CoreData

let ClientID = "hSqze22iVj0_vMWY9ePZ"


class Test1ViewController: UIViewController, AVAudioPlayerDelegate {


    @IBOutlet weak var step1Image: UIImageView!
    @IBOutlet weak var step1Word: UILabel!
    @IBOutlet weak var step1Pronun: UILabel!
    @IBOutlet weak var pageNum: UIImageView!
    @IBOutlet weak var heart: UIImageView!
    @IBOutlet weak var heart2: UIImageView!
    @IBOutlet weak var heart3: UIImageView!
    
    
    var pageNumber: Int = 0
    var testData: String = ""
    var reviewPageNum: Array<Int>?
    public var animationView = LOTAnimationView()
    var soundName: String = ""
    let DataView = ViewData()
    var step1FileName: String = ""
    
    // 메인화면으로 이동
    @IBAction func goHome(_ sender: UIButton) {
        self.pressedBtn()
        
        self.navigationController?.popToRootViewController(animated: false)
        ViewData.shared.selectedReview = nil
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
 
        Test1Data.shared.opportunity = 4
        recognitionResultLabel.text = nil
    }
    
    
    func sendData() {
        let pageNumImg: String = Test1Data.shared.pageNum[pageNumber]
        pageNum.image = UIImage(named: pageNumImg)
        self.testDataDefault()
        animationView.removeFromSuperview()
        
        if testData == "tinoEasy" {
            step1FileName = Test1Data.shared.tinoEasyFileName[pageNumber]
            step1Image.image = UIImage(named: step1FileName)
            step1Word.text = Test1Data.shared.tinoEasyTextArray[pageNumber]
            step1Pronun.text = Test1Data.shared.tinoEasyPronunArray[pageNumber]
        }
        else if testData == "tinoHard" {
            step1FileName = Test1Data.shared.tinoHardFileName[pageNumber]
            step1Image.image = UIImage(named: step1FileName)
            step1Word.text = Test1Data.shared.tinoHardTextArray[pageNumber]
            step1Pronun.text = Test1Data.shared.tinoHardPronunArray[pageNumber]
        }
        else if testData == "yaguEasy" {
            step1FileName = Test1Data.shared.yaguEasyFileName[pageNumber]
            step1Image.image = UIImage(named: step1FileName)
            step1Word.text = Test1Data.shared.yaguEasyTextArray[pageNumber]
            step1Pronun.text = Test1Data.shared.yaguEasyPronunArray[pageNumber]
        }
        else if testData == "yaguHard" {
            step1FileName = Test1Data.shared.yaguHardFileName[pageNumber]
            step1Image.image = UIImage(named: step1FileName)
            step1Word.text = Test1Data.shared.yaguHardTextArray[pageNumber]
            step1Pronun.text = Test1Data.shared.yaguHardPronunArray[pageNumber]
        }
        else if testData == "paulEasy" {
            step1FileName = Test1Data.shared.paulEasyFileName[pageNumber]
            step1Image.image = UIImage(named: step1FileName)
            step1Word.text = Test1Data.shared.paulEasyTextArray[pageNumber]
            step1Pronun.text = Test1Data.shared.paulEasyPronunArray[pageNumber]
        }
        else if testData == "paulHard" {
            step1FileName = Test1Data.shared.paulHardFileName[pageNumber]
            step1Image.image = UIImage(named: step1FileName)
            step1Word.text = Test1Data.shared.paulHardTextArray[pageNumber]
            step1Pronun.text = Test1Data.shared.paulHardPronunArray[pageNumber]
        }
    }
    
    @IBAction func nextPage() {
        pageNumber += 1;
        self.audioPlayer?.pause()
//        animationView.removeFromSuperview()
//        self.animationView.isHidden = true
        if pageNumber == 10 {
            // 화면 전환할 뷰 컨트롤러를 Storyboard ID 정보를 이용, 읽어와서 객체로 생성함
            //self.defaultReviewData()
            self.addReviewPageNum()
            print(reviewPageNum ?? "yuyu")
            if let view = self.storyboard?.instantiateViewController(withIdentifier: "Test2View") {
                // 화면을 전환함
                self.navigationController?.pushViewController(view, animated: false)
                }
        }
        else {
            self.sendData()
//            self.addReviewPageNum()
//            print(pageNumber)
        }
    }
    
    func defaultReviewData() {
        if testData == "tinoEasy" {
                Test1Data.shared.tinoEasyReview = []
        }
        else if testData == "tinoHard" {
                Test1Data.shared.tinoHardReview = []
        }
        else if testData == "yaguEasy" {
                Test1Data.shared.yaguEasyReview = []
        }
        else if testData == "yaguHard" {
                Test1Data.shared.yaguHardReview = []
        }
        else if testData == "paulEasy" {
                Test1Data.shared.paulEasyReview = []
        }
        else if testData == "paulHard" {
                Test1Data.shared.paulHardReview = []
        }
    }

    
    public func heartAnimation () {
        let animationView = LOTAnimationView(name: "heart_anim")
        
        if Test1Data.shared.opportunity == 3 {
            animationView.frame = CGRect(x: 770, y: 154, width: 50, height: 45)
            self.view.addSubview(animationView)
            animationView.play()
            heart.isHidden = true
        }
        else if Test1Data.shared.opportunity == 2 {
            animationView.frame = CGRect(x: 822, y: 154, width: 50, height: 45)
            self.view.addSubview(animationView)
            animationView.play()
            heart2.isHidden = true
        }
        else if Test1Data.shared.opportunity == 1 {
            animationView.frame = CGRect(x: 872, y: 154, width: 50, height: 45)
            self.view.addSubview(animationView)
            animationView.play()
            heart3.isHidden = true
//            saveReviewWord()
            
            reviewPageNum?.append(pageNumber)
            
            print(pageNumber)
            print(reviewPageNum)
//            YaguReviewData.shared.reviewWord.append(pageNumber)
//            print(YaguReviewData.shared.reviewWord)
//            finishTest()
//            nextPage()
        }
    }
    
    public func addReviewPageNum() {
        if let reviewPageNum = reviewPageNum {
            if testData == "tinoEasy" {
                Test1Data.shared.tinoEasyReview = reviewPageNum
            }
            else if testData == "tinoHard" {
                Test1Data.shared.tinoHardReview = reviewPageNum
            }
            else if testData == "yaguEasy" {
                Test1Data.shared.yaguEasyReview = reviewPageNum
            }
            else if testData == "yaguHard" {
                Test1Data.shared.yaguHardReview = reviewPageNum
            }
            else if testData == "paulEasy" {
                Test1Data.shared.paulEasyReview = reviewPageNum
            }
            else if testData == "paulHard" {
                Test1Data.shared.paulHardReview = reviewPageNum
                }
            }
        }


//func setIntroPopUp() {
//        intro.introLabel?.text = "5번의 단어 연습 기회가 있고"
////    let popUpView = IntroPopUp.instanceFromNib()
//    let popUpView = IntroPopUp.instanceFromNib()
//    guard let str = self.restorationIdentifier else { return }
//    print(str)
////    popUpView.
//
//    popUpView.frame = self.view.frame
//    intro.changeText(str: str)
//    self.view.addSubview(popUpView)
//}

    //    let str = "5번의 단어 연습 기회가 있고,\n 단어를 정확히 얘기하면\n다음으로 넘어갈 수 있어!"
    //    IntroPopUp.changeText(str)
    //    IntroPopUp.introl
    
    func setIntroPopUp() {
//        let popUpVC = ChildViewController()
//
//        popUpVC.modalPresentationStyle = .overCurrentContext
//        popUpVC.view.alpha = 0.2
//        self.present(popUpVC, animated: false, completion: nil)
        
        let introVC = IntroViewController()
        guard let storyBoardID = self.restorationIdentifier else { return }
//        introVC(str: Main)
        introVC.modalPresentationStyle = .overFullScreen //.overCurrentContext
//        introVC.view.alpha = 0.5
        self.present(introVC, animated: true, completion: nil)
        
        
//        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let nextView = storyboard.instantiateViewController(withIdentifier: "IntroView") as! IntroViewController
//        nextView.modalPresentationStyle = .overFullScreen //.overCurrentContext
//        self.navigationController?.pushViewController(nextView, animated: false)
//        self.present(nextView, animated: false, completion: nil)
        
    }
    
//    let storyboard: UIStoryboard = UIStoryboard(name: "Collection", bundle: nil)
//    let nextView = storyboard.instantiateViewController(withIdentifier: "ProjectView") as! CollectionTableViewController
//    nextView.modelProject2 = modelProject.searchProjectOfTitle(title: (btn.titleLabel?.text)!)
//    self.navigationController?.pushViewController(nextView, animated: true)
//    //        self.present(nextView!, animated: true, completion: nil)

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        print("set")
//        self.setIntroPopUp()
//    }
    
//    let childVC = ChildViewController()
//
//    childVC.view.backgroundColor = .green
//
//    // overFullScreen은 뷰의 alpha 값이 적용 된다.
//    childVC.modalPresentationStyle = .overFullScreen
//
//    // 알파값 적용
//    childVC.view.alpha = 0.3
//
//    self.present(childVC, animated: true, completion: nil)
//
    
    
    
    
//    //    let modalVC = ModalVC.instantiateFromStoryboard("IntroView")
//    //    self.present(modalVC, animated: true, completion: nil)
//
//    let vc = (
//        storyboard?.instantiateViewController(withIdentifier: "IntroView"))!
//    ////    vc.view.backgroundColor = UIColor.orange()
//    //    vc.modalTransitionStyle = .crossDissolve
//    //    vc.view.alpha = 0.3
//    ////    vc.modalTransitionStyle = .over
//    //    present(vc, animated: true, completion: nil)
//
//    //    let vc = IntroViewController()
//    vc.view.backgroundColor = UIColor(white: 0, alpha: 0.75)
//    vc.modalPresentationStyle = .overCurrentContext
//    //    view?.backgroundColor = UIColor(white: 1, alpha: 0.5)
//    //        vc.view.a backgroundColor.alpha = 0.75
//    self.present(vc, animated: false, completion: nil)
    
    func intro() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let storyboardId = self.restorationIdentifier else { return }
        
        guard let vc =
            storyboard.instantiateViewController(withIdentifier: "IntroView") as? IntroViewController else { return }
        vc.labelText = DataView.changeLabel(storyBoardId: storyboardId)
        vc.view.backgroundColor = UIColor(white: 0, alpha: 0.75)
        vc.modalPresentationStyle = .overCurrentContext
        
        self.present(vc, animated: false, completion: nil)
    }
    

    // MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()

        intro()
        
        self.receiveData()
        self.sendData()
        audioPlayer?.prepareToPlay()
        
    //    correctLottie()
        
    }

    // MARK:- Properties
    var audioPlayer: AVAudioPlayer?
    
    // MARK: IBOutlets
    @IBOutlet var playPauseButton: UIButton!
   
    
    // MARK: - Methods
    // MARK: - Custom Method
//    func initializePlayer() {
//        guard let soundAsset: NSDataAsset = NSDataAsset(name: "yagugong1_1") else {
//            print("음원 파일 에셋을 가져올 수 없습니다")
//            return
//        }
//
//        do {
//            try self.audioPlayer = AVAudioPlayer(data: soundAsset.data)
//            self.audioPlayer!.delegate = self
//        } catch let error as NSError {
//            print("플레이어 초기화 실패")
//            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
//        }
//    }
    func initializePlayer(soundName: String) {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: soundName) else {
            print("음원 파일 에셋을 가져올 수 없습니다")
            return
        }
        do {
            try self.audioPlayer = AVAudioPlayer(data: soundAsset.data)
            self.audioPlayer!.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
    }
    
    func pressedPronunciation() {
        soundName = "\(step1FileName)_sound"
        initializePlayer(soundName: soundName)
    }
    
    func pressedBtn() {
        soundName = "1.app-button"
        initializePlayer(soundName: soundName)
        self.audioPlayer?.play()
    }
    
    func pressedRecordBtn() {
        soundName = "5.app-record_start"
        initializePlayer(soundName: soundName)
        self.audioPlayer?.play()
    }
    
//    func finishedRecordBtn() {
//        soundName = "6.app-record_end"
//        initializePlayer(soundName: soundName)
//        self.audioPlayer?.play()
//    }
    
    func removeHeart() {
        soundName = "7.app-incorrect"
        initializePlayer(soundName: soundName)
        self.audioPlayer?.play()
//        self.audioPlayer?.pl
    }
    
    func finishTest() {
        soundName = "8.app-correct"
        initializePlayer(soundName: soundName)
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
        if soundName == "7.app-incorrect" {
            confirmOpportunity()
        }
    }
    
    
    func confirmOpportunity() {
        if Test1Data.shared.opportunity == 1 {
            nextPage()
        }
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
        pressedRecordBtn()
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
extension Test1ViewController: NSKRecognizerDelegate {
    
    public func recognizerDidEnterReady(_ aRecognizer: NSKRecognizer!) {
        print("Event occurred: Ready")
        self.recognitionResultLabel.textColor = blackcolor
        self.recognitionResultLabel.text = "발음해보세요"
        // self.setRecognitionButtonTitle(withText: "Stop", color: .red)
        self.recognitionButton.isEnabled = true
    }
    
    public func recognizerDidDetectEndPoint(_ aRecognizer: NSKRecognizer!) {
        print("Event occurred: End point detected")
    }
    
    public func recognizerDidEnterInactive(_ aRecognizer: NSKRecognizer!) {
        print("Event occurred: Inactive")
        
        // self.setRecognitionButtonTitle(withText: "Record", color: .blue)
        self.recognitionButton.isEnabled = true
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategorySoloAmbient)
    }
    
    public func recognizer(_ aRecognizer: NSKRecognizer!, didRecordSpeechData aSpeechData: Data!) {
        print("Record speech data, data size: \(aSpeechData.count)")
        
    }
    
    public func compareResult() {
      //  finalResult = aResult
    }
    
    
    public func recognizer(_ aRecognizer: NSKRecognizer!, didReceivePartialResult aResult: String!) {
        print("Partial result: \(aResult)")
        
        // let wrongString = NSMutableAttributedString(string: aResult)
        if let aResult = aResult {
            if step1Word.text != aResult {
                self.recognitionResultLabel.textColor = redcolor
                self.recognitionResultLabel.text = aResult
            } else {
                self.recognitionResultLabel.textColor = bluecolor
                self.recognitionResultLabel.text = aResult
            }
        }
    }
    
//    let attributedString = NSMutableAttributedString(string: myLabel.text)
//
//
//    attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: (text as NSString).range(of:"Zedd"))
//
//    myLabel.attributedText = attributedString
    
    
    public func recognizer(_ aRecognizer: NSKRecognizer!, didReceiveError aError: Error!) {
        print("Error: \(aError)")
        
        // self.setRecognitionButtonTitle(withText: "Record", color: .blue)
        self.recognitionButton.isEnabled = true
        self.recognitionResultLabel.text = "Error: " + aError.localizedDescription
        
        if self.speechRecognizer.isRunning {
            self.speechRecognizer.cancel()
            self.recognitionResultLabel.text = "Canceled"
            // self.setRecognitionButtonTitle(withText: "Record", color: .blue)
            self.recognitionButton.isEnabled = true
            try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategorySoloAmbient)
        }
    }
    
    public func recognizer(_ aRecognizer: NSKRecognizer!, didReceive aResult: NSKRecognizedResult!) {


        
        if let result = aResult.results.first as? String {
//            print("Final result: \(aResult)")
            print("Final result: \(result)")
            self.recognitionResultLabel.text = result
            if step1Word.text != result {
                removeHeart()
                Test1Data.shared.opportunity -= 1
                heartAnimation()
                self.recognitionResultLabel.textColor = redcolor
                self.recognitionResultLabel.text = result
            } else {
                self.recognitionResultLabel.textColor = bluecolor
                self.recognitionResultLabel.text = result

                finishTest()
                correctLottie()
                }
            recognitionButton.isSelected = false
            recognitionButton.setImage(UIImage(named : "voiceBtn"), for: UIControlState.normal)

        }
    }

    
    func correctLottie() {
        let randomNo: UInt32 = arc4random_uniform(5) + 1;
        let correctIconImageName = "correct_icon\(randomNo)"
        print(correctIconImageName)
        animationView = LOTAnimationView(name: correctIconImageName)
        animationView.frame = CGRect(x: 0, y: 0, width: 1024, height: 768)
        self.view.addSubview(animationView)
        animationView.play(completion: {(true) in self.nextPage()})
    }
    
    func setRecognitionButtonTitle(withText text: String, color: UIColor) {
        recognitionButton.setTitle(text, for: .normal)
        recognitionButton.setTitleColor(color, for: .normal)
    }


    
    
//    func myButtonTapped(){
//        if myButton.isSelected == true {
//            myButton.isSelected = false
//            myButton.setImage(UIImage(named : "unselectedImage"), forState: UIControlState.Normal)
//        }else {
//            myButton.isSelected = true
//            myButton.setImage(UIImage(named : "selectedImage"), forState: UIControlState.Normal)
//        }
//    }
}
