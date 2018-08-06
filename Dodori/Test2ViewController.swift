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

// let ClientID = "hSqze22iVj0_vMWY9ePZ"

import UIKit

class Test2ViewController: UIViewController, AVAudioPlayerDelegate {
    // MARK:- Properties
    var player: AVAudioPlayer!
    
    // MARK: IBOutlets
    @IBOutlet var playPauseButton: UIButton!
  
    @IBOutlet weak var step2Image: UIImageView!
    @IBOutlet weak var step2Sentence: UILabel!
    @IBOutlet weak var step2Pronun: UILabel!
    @IBOutlet weak var pageNum: UIImageView!
  
    @IBOutlet weak var heart: UIImageView!
    @IBOutlet weak var heart2: UIImageView!
    @IBOutlet weak var heart3: UIImageView!
    @IBOutlet weak var heart4: UIImageView!
    @IBOutlet weak var heart5: UIImageView!
    
    
    let Data2 = Test2Data()
    var pageNumber:Int = 0
    var testData: String = ""
    
    // 메인화면으로 이동
    @IBAction func goHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: false)
    }
    
    @IBAction func nextPage(_ sender: Any) {
        pageNumber += 1;
        
        if pageNumber == 10 {
            // 화면 전환할 뷰 컨트롤러를 Storyboard ID 정보를 이용, 읽어와서 객체로 생성함
            if let view = self.storyboard?.instantiateViewController(withIdentifier: "Intro2") {
                // 화면을 전환합니다.
                self.navigationController?.pushViewController(view, animated: false)
            }
        }
        else {
            let step2Img: String = Data2.yaguEasyImageName[pageNumber]
            step2Image.image = UIImage(named: step2Img)
            step2Sentence.text = Data2.yaguEasyTextArray[pageNumber]
            step2Pronun.text = Data2.yaguEasyPronunArray[pageNumber]
        }
    }
    
    func testDataDefault() {
        heart.isHidden = false
        heart2.isHidden = false
        heart3.isHidden = false
        heart4.isHidden = false
        heart5.isHidden = false

        Data2.opportunity = 5
        recognitionResultLabel.text = nil
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
    
    func sendData() {
        let pageNumImg: String = Data2.pageNum[pageNumber]
        pageNum.image = UIImage(named: pageNumImg)
        
//        if testData == "tinoEasy" {
//            self.testDataDefault()

//            let step2Img: String = Data2.tinoEasyImageName[pageNumber]
//            step2Image.image = UIImage(named: step2Img)
//            step2Sentence.text = Data2.tinoEasyTextArray[pageNumber]
//            step2Pronun.text = Data2.tinoEasyPronunArray[pageNumber]
//            recognitionResultLabel.text = nil
//        }
//        else if testData == "tinoHard" {
//            self.testDataDefault()
//
//            let step2Img: String = Data1.tinoHardImageName[pageNumber]
//            step2Image.image = UIImage(named: step2Img)
//            step2Sentence.text = Data2.tinoHardTextArray[pageNumber]
//            step2Pronun.text = Data2.tinoHardPronunArray[pageNumber]
//            recognitionResultLabel.text = nil
//        }
         if testData == "yaguEasy" {
            self.testDataDefault()

            let step2Img: String = Data2.yaguEasyImageName[pageNumber]
            step2Image.image = UIImage(named: step2Img)
            step2Sentence.text = Data2.yaguEasyTextArray[pageNumber]
            step2Pronun.text = Data2.yaguEasyPronunArray[pageNumber]
            recognitionResultLabel.text = nil
        }
        else if testData == "yaguHard" {
            self.testDataDefault()

            let step2Img: String = Data2.yaguHardImageName[pageNumber]
            step2Image.image = UIImage(named: step2Img)
            step2Sentence.text = Data2.yaguHardTextArray[pageNumber]
            step2Pronun.text = Data2.yaguHardPronunArray[pageNumber]
            recognitionResultLabel.text = nil
        }
        else if testData == "paulEasy" {
            self.testDataDefault()

            let step2Img: String = Data2.yaguEasyImageName[pageNumber]
            step2Image.image = UIImage(named: step2Img)
            step2Sentence.text = Data2.yaguEasyTextArray[pageNumber]
            step2Pronun.text = Data2.yaguEasyPronunArray[pageNumber]
            recognitionResultLabel.text = nil
        }
        else if testData == "paulHard" {
            self.testDataDefault()

            let step2Img: String = Data2.yaguHardImageName[pageNumber]
            step2Image.image = UIImage(named: step2Img)
            step2Sentence.text = Data2.yaguHardTextArray[pageNumber]
            step2Pronun.text = Data2.yaguHardPronunArray[pageNumber]
            recognitionResultLabel.text = nil
        }
    }
    
    
    // MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initializePlayer()
        
        receiveData()
        sendData()
    }
    
    // MARK: - Methods
    // MARK: - Custom Method
    func initializePlayer() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "yagugong2_1") else {
            print("음원 파일 에셋을 가져올 수 없습니다")
            return
        }
        
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
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
    
    func audioPlayerDidFinishPlaying(_ Player: AVAudioPlayer, successgully flag: Bool) {
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
        if self.speechRecognizer.isRunning {
            self.speechRecognizer.stop()
        } else {
            try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryRecord)
            self.speechRecognizer.start(with: .korean)
            self.recognitionButton.isEnabled = false
        }
    }
    
    // MARK: - property
    @IBOutlet weak var recognitionResultLabel: UILabel!
    @IBOutlet weak var recognitionButton: UIButton!
    
    fileprivate let speechRecognizer: NSKRecognizer
    fileprivate let languages = Languages()
    
    let word = "관심을 끌 것이라 생각했지"
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
    
    
    
    public func recognizer(_ aRecognizer: NSKRecognizer!, didReceivePartialResult aResult: String!) {
        print("Partial result: \(aResult)")
        if word != aResult {
            self.recognitionResultLabel.textColor = redcolor
            self.recognitionResultLabel.text = aResult
        }
        else {
            self.recognitionResultLabel.textColor = bluecolor
            self.recognitionResultLabel.text = aResult
        }
    }
    
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
        print("Final result: \(aResult)")
        
        if let result = aResult.results.first as? String {
            self.recognitionResultLabel.text = result
        }
    }
    
    func setRecognitionButtonTitle(withText text: String, color: UIColor) {
        recognitionButton.setTitle(text, for: .normal)
        recognitionButton.setTitleColor(color, for: .normal)
    }
}
