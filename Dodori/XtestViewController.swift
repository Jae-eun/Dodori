//
//  XtestViewController.swift
//  Dodori
//
//  Created by 이재은 on 2018. 7. 18..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import NaverSpeech
// import Common
import AVFoundation
import Lottie

//let ClientID = "hSqze22iVj0_vMWY9ePZ"

//
//class XtestViewController: UIViewController, AVAudioPlayerDelegate {
//
//    @IBOutlet weak var step1Image: UIImageView!
//
//
//    @IBOutlet weak var nextBtn: UIButton!
//
//    @IBOutlet weak var step1Word: UILabel!
//    @IBOutlet weak var step1Pronun: UILabel!
//    @IBOutlet weak var pageNum: UIImageView!
//    @IBOutlet weak var heart: UIImageView!
//    @IBOutlet weak var heart2: UIImageView!
//    @IBOutlet weak var heart3: UIImageView!
//    @IBOutlet weak var heart4: UIImageView!
//    @IBOutlet weak var heart5: UIImageView!
//
//
//    @IBOutlet weak var recognitionResultLabel: UILabel!
//    @IBOutlet weak var recognitionButton: UIButton!
//
//    let Data1 = Test1Data()
//    var pageNumber:Int = 0
//
//    @IBAction func goHome(_ sender: Any) {
//        self.navigationController?.popToRootViewController(animated: false)
//    }
//
//    @IBAction func nextPage(_ sender: Any) {
//        pageNumber += 1;
//
//        if pageNumber == 10 {
//            // 화면 전환할 뷰 컨트롤러를 Storyboard ID 정보를 이용, 읽어와서 객체로 생성함
//            if let view = self.storyboard?.instantiateViewController(withIdentifier: "Intro2") {
//                // 화면을 전환함
//                self.navigationController?.pushViewController(view, animated: false)
//            }
//        }
//        else {
//            heart.isHidden = false
//            heart2.isHidden = false
//            heart3.isHidden = false
//            heart4.isHidden = false
//            heart5.isHidden = false
//            Data1.opportunity = 5
//            let step1Img:String = Data1.yaguEasyImageName[pageNumber]
//            step1Image.image = UIImage(named: step1Img)
//            step1Word.text = Data1.yaguEasyTextArray[pageNumber]
//            step1Pronun.text = Data1.yaguEasyPronunArray[pageNumber]
//            recognitionResultLabel.text = nil
//        }
//    }
//
//    public func moveNextPage() {
//        pageNumber += 1;
//
//        if pageNumber == 10 {
//            // 화면 전환할 뷰 컨트롤러를 Storyboard ID 정보를 이용, 읽어와서 객체로 생성함
//            if let view = self.storyboard?.instantiateViewController(withIdentifier: "Intro2") {
//                // 화면을 전환함
//                self.navigationController?.pushViewController(view, animated: false)
//            }
//        }
//        else {
//            heart.isHidden = false
//            heart2.isHidden = false
//            heart3.isHidden = false
//            heart4.isHidden = false
//            heart5.isHidden = false
//            Data1.opportunity = 5
//            let step1Img:String = Data1.yaguEasyImageName[pageNumber]
//            step1Image.image = UIImage(named: step1Img)
//            step1Word.text = Data1.yaguEasyTextArray[pageNumber]
//            step1Pronun.text = Data1.yaguEasyPronunArray[pageNumber]
//            recognitionResultLabel.text = nil
//        }
//    }
//
//    // MARK:- Properties
//    var player: AVAudioPlayer?
//
//    // MARK: IBOutlets
//    @IBOutlet var playPauseButton: UIButton!
//
//
//
//    @IBAction func lottiBtn(_ sender: Any) {
//
//        let animationView = LOTAnimationView(name: "heart_animation")
//        animationView.frame = CGRect(x: 643, y: 167, width: 56, height: 50)
//        self.view.addSubview(animationView)
//        animationView.play()
//        heart.isHidden = true
//
//        animationView.loopAnimation = false // 무한 반복
//    }
//
//    public func heartAnimation () {
//        let animationView = LOTAnimationView(name: "heart_animation")
//        if Data1.opportunity == 5 {
//            animationView.frame = CGRect(x: 176, y: 20, width: 56, height: 50)
//            self.view.addSubview(animationView)
//            animationView.play()
//            heart.isHidden = true
//        }
//        else if Data1.opportunity == 4 {
//            animationView.frame = CGRect(x: 232, y: 20, width: 56, height: 50)
//            self.view.addSubview(animationView)
//            animationView.play()
//            heart2.isHidden = true
//        }
//        else if Data1.opportunity == 3 {
//            animationView.frame = CGRect(x: 290, y: 20, width: 56, height: 50)
//            self.view.addSubview(animationView)
//            animationView.play()
//            heart3.isHidden = true
//        }
//        else if Data1.opportunity == 2 {
//            animationView.frame = CGRect(x: 346, y: 20, width: 56, height: 50)
//            self.view.addSubview(animationView)
//            animationView.play()
//            heart4.isHidden = true
//        }
//        else if Data1.opportunity == 1 {
//            animationView.frame = CGRect(x: 405, y: 20, width: 56, height: 50)
//            self.view.addSubview(animationView)
//            animationView.play()
//            heart5.isHidden = true
//        }
//    }
//
//
//
//    // MARK: - override
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        self.initializePlayer()
//
//        let step1Img:String = Data1.yaguEasyImageName[0]
//        step1Image.image = UIImage(named: step1Img)
//        step1Word.text = Data1.yaguEasyTextArray[0]
//        step1Pronun.text = Data1.yaguEasyPronunArray[0]
//
//      //  step1Img.hidden = true
//        self.initializePlayer()
//        self.player?.play()
//        nextBtn.isHidden = true
//
//    }
//
//
//    // MARK: - Methods
//    // MARK: - Custom Method
//    func initializePlayer() {
//        guard let soundAsset: NSDataAsset = NSDataAsset(name: "yagugong1_1") else {
//            print("음원 파일 에셋을 가져올 수 없습니다")
//            return
//        }
//
//        do {
//            try self.player = AVAudioPlayer(data: soundAsset.data)
//            self.player!.delegate = self
//        } catch let error as NSError {
//            print("플레이어 초기화 실패")
//            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
//        }
//    }
//
//
//    @IBAction func touchUpPlayPauseButton(_ sender: UIButton) {
//
//        sender.isSelected = !sender.isSelected
//
//        if sender.isSelected {
//            self.player?.play()
//        } else {
//            self.player?.pause()
//        }
//
//    }
//
//
//    // MARK: AVAudioPlayerDelegate
//    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
//        guard let error: Error = error else {
//            print("오디오 플레이어 디코드 오류발생")
//            return
//        }
//
//        let message: String
//        message = "오디오 플레이어 오류 발생 \(error.localizedDescription)"
//
//        let alert: UIAlertController = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertControllerStyle.alert)
//
//        let okAction: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default) { (action: UIAlertAction) -> Void in
//
//            self.dismiss(animated: true, completion: nil)
//        }
//        alert.addAction(okAction)
//        self.present(alert, animated: true, completion: nil)
//    }
//
//    func audioPlayerDidFinishPlaying(_ Player: AVAudioPlayer, successfully flag: Bool) {
//        self.playPauseButton.isSelected = false
//                nextBtn.isHidden = false
//    }
//
//
//
//
//
//    // MARK: - init
////    required init?(coder aDecoder: NSCoder) {
////        /*
////         *  NSKRecognizer를 초기화 하는데 필요한 NSKRecognizerConfiguration을 생성합니다.
////         *  configuration의 EPD(End Point Detection)type의 default값은 auto 이므로 여기에서 따로 값을 setting하지 않아도 됩니다.
////         */
////       // let configuration = NSKRecognizerConfiguration(clientID: ClientID)
////        configuration?.canQuestionDetected = true
////        self.speechRecognizer = NSKRecognizer(configuration: configuration)
////        super.init(coder: aDecoder)
////
////        self.speechRecognizer.delegate = self
////    }
//
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//
//        if self.isViewLoaded && self.view.window == nil {
//            self.view = nil
//        }
//    }
//
//    /*
//     * Auto mode는 화자의 발화가 일정시간 이상 지속되지 않으면 자동으로 끝점을 인식하여 음성인식이 종료됩니다.
//     * 이 sample app에서는 button으로 음성인식을 시작하고 끝내게 됩니다.
//     * 인식기가 동작 중일 때 button에 대한 tap action이 들어오면 인식기를 중지 시킵니다.
//     * 인식기가 동작 중이지 않을 때 button에 대한 tap action이 들어오면 인식기에 언어 코드를 넣어서 인식기를 시작시킵니다.
//     */
//    @IBAction func recognitionButtonTapped(_ sender: Any) {
//        if self.speechRecognizer.isRunning {
//            self.speechRecognizer.stop()
//        } else {
//            try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryRecord)
//            self.speechRecognizer.start(with: .korean)
//            self.recognitionButton.isEnabled = false
//        }
//    }
//
//    // MARK: - property
//
//
//    fileprivate let speechRecognizer: NSKRecognizer
//    fileprivate let languages = Languages()
//
//
//    var result = ""
//    let redcolor = UIColor(red: 1,
//                           green: 0,
//                           blue: 0,
//                           alpha: 1)
//
//    let bluecolor = UIColor(red: 0,
//                            green: 0,
//                            blue: 1,
//                            alpha: 1)
//
//    let blackcolor = UIColor(red: 0,
//                             green: 0,
//                             blue: 0,
//                             alpha: 1)
//}
//
///*
// * NSKRecognizerDelegate protocol 구현부
// */
//extension XtestViewController: NSKRecognizerDelegate {
//
//    public func recognizerDidEnterReady(_ aRecognizer: NSKRecognizer!) {
//        print("Event occurred: Ready")
//        self.recognitionResultLabel.textColor = blackcolor
//        self.recognitionResultLabel.text = "발음해보세요"
//        // self.setRecognitionButtonTitle(withText: "Stop", color: .red)
//        self.recognitionButton.isEnabled = true
//    }
//
//    public func recognizerDidDetectEndPoint(_ aRecognizer: NSKRecognizer!) {
//        print("Event occurred: End point detected")
//    }
//
//    public func recognizerDidEnterInactive(_ aRecognizer: NSKRecognizer!) {
//        print("Event occurred: Inactive")
//
//        // self.setRecognitionButtonTitle(withText: "Record", color: .blue)
//        self.recognitionButton.isEnabled = true
//        try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategorySoloAmbient)
//    }
//
//    public func recognizer(_ aRecognizer: NSKRecognizer!, didRecordSpeechData aSpeechData: Data!) {
//        print("Record speech data, data size: \(aSpeechData.count)")
//
//    }
//
//
//
//    public func recognizer(_ aRecognizer: NSKRecognizer!, didReceivePartialResult aResult: String!) {
//        print("Partial result: \(aResult)")
//        if step1Word.text != aResult {
////            heartAnimation()
////            Data1.opportunity -= 1
//            self.recognitionResultLabel.textColor = redcolor
//            self.recognitionResultLabel.text = aResult
//        }
//        else {
//            self.recognitionResultLabel.textColor = bluecolor
//            self.recognitionResultLabel.text = aResult
//        }
//    }
//
//    public func recognizer(_ aRecognizer: NSKRecognizer!, didReceiveError aError: Error!) {
//        print("Error: \(aError)")
//
//        // self.setRecognitionButtonTitle(withText: "Record", color: .blue)
//        self.recognitionButton.isEnabled = true
//        self.recognitionResultLabel.text = "Error: " + aError.localizedDescription
//
//        if self.speechRecognizer.isRunning {
//            self.speechRecognizer.cancel()
//            self.recognitionResultLabel.text = "Canceled"
//            // self.setRecognitionButtonTitle(withText: "Record", color: .blue)
//            self.recognitionButton.isEnabled = true
//            try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategorySoloAmbient)
//        }
//    }
//
//    public func recognizer(_ aRecognizer: NSKRecognizer!, didReceive aResult: NSKRecognizedResult!) {
//        print("Final result: \(aResult)")
//
//        if let result = aResult.results.first as? String {
//            self.recognitionResultLabel.text = result
//
//            if step1Word.text != result {
//                heartAnimation()
//                Data1.opportunity -= 1
//                self.recognitionResultLabel.textColor = redcolor
//                self.recognitionResultLabel.text = result
//            }
//            else {
//                self.recognitionResultLabel.textColor = bluecolor
//                self.recognitionResultLabel.text = result
//                moveNextPage()
//            }
//        }
//    }
//
//    func setRecognitionButtonTitle(withText text: String, color: UIColor) {
//        recognitionButton.setTitle(text, for: .normal)
//        recognitionButton.setTitleColor(color, for: .normal)
//    }
//
//
//
//}
