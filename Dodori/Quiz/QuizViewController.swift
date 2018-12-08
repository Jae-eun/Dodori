//
//  QuizViewController.swift
//  Dodori
//
//  Created by SWUCOMPUTER on 2018. 6. 13..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import AVFoundation

class QuizViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var quizImageView: UIImageView!
    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var ThirdBtn: UIButton!
    @IBOutlet weak var pageNumImageView: UIImageView!
    
    // MARK:- Properties
    var audioPlayer: AVAudioPlayer!
    
    // MARK: IBOutlets
    @IBOutlet var replayButton: UIButton!
    
    let Data4 = QuizData()
    var pageNumber: Int = 0
    var testData: String = ""
    let DataView = ViewData()
    var soundName: String = ""
    
    
    func setIntroPopUp() {
        let popUpView = IntroPopUp.instanceFromNib()
        popUpView.frame = self.view.frame
        self.view.addSubview(popUpView)
    }
    
    func intro() {
        guard let storyboardId = self.restorationIdentifier else { return }
        
        guard let vc =
            storyboard?.instantiateViewController(withIdentifier: "IntroView") as? IntroViewController else { return }
        vc.labelText = DataView.changeLabel(storyBoardId: storyboardId)
        vc.view.backgroundColor = UIColor(white: 0, alpha: 0.75)
        vc.modalPresentationStyle = .overCurrentContext
        
        self.present(vc, animated: false, completion: nil)
    }
    
    
    // MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        intro()
        
//        self.initializePlayer()
//        self.player?.play()
        
        receiveData()
        sendData()
    }
    
    @IBAction func goHome(_ sender: Any) {
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
    
//    func testDataDefault() {
//        Data1.opportunity = 5
//        recognitionResultLabel.text = nil
//    }
    
    func sendData() {
        let pageNumImg: String = QuizData.shared.pageNum[pageNumber]
        pageNumImageView.image = UIImage(named: pageNumImg)
        // self.testDataDefault()
        if testData == "tinoEasy" {
            let quizImg: String = QuizData.shared.tinoEasyQuizImageName[pageNumber]
            quizImageView.image = UIImage(named: quizImg)
            quizLabel.text = QuizData.shared.tinoEasyTextArray[pageNumber]
        }
        else if testData == "tinoHard" {
            let quizImg: String = QuizData.shared.tinoHardQuizImageName[pageNumber]
            quizImageView.image = UIImage(named: quizImg)
            quizLabel.text = QuizData.shared.tinoHardTextArray[pageNumber]
        }
        else if testData == "paulEasy" {
            let quizImg: String = QuizData.shared.paulEasyQuizImageName[pageNumber]
            quizImageView.image = UIImage(named: quizImg)
            quizLabel.text = QuizData.shared.paulEasyTextArray[pageNumber]
        }
        else if testData == "paulHard" {
            let quizImg: String = QuizData.shared.paulHardQuizImageName[pageNumber]
            quizImageView.image = UIImage(named: quizImg)
            quizLabel.text = QuizData.shared.paulHardTextArray[pageNumber]
        }
        else if testData == "paulEasy" {
            let quizImg: String = QuizData.shared.yaguEasyQuizImageName[pageNumber]
            quizImageView.image = UIImage(named: quizImg)
            quizLabel.text = QuizData.shared.paulEasyTextArray[pageNumber]
        }
        else if testData == "paulHard" {
            let quizImg: String = QuizData.shared.yaguHardQuizImageName[pageNumber]
            quizImageView.image = UIImage(named: quizImg)
            quizLabel.text = QuizData.shared.paulHardTextArray[pageNumber]
        }
    }
    
    func setQuizSound() {
        if testData == "tinoEasy" {
//            Data4.tinoEasyQuizSound[0].1.1]
//            QuizData.shared.tinoEasyQuizSound1[pageNumber]
        }
        else if testData == "tinoHard" {
           
        }
        else if testData == "paulEasy" {
            
        }
        else if testData == "paulHard" {
            
        }
        else if testData == "paulEasy" {
            
        }
        else if testData == "paulHard" {
            
        }
        
        soundName = "5.app-record_start"
//                initializePlayer(soundName: soundName)
                self.audioPlayer?.play()
    }
    
    
    
    @IBAction func nextPage(_ sender: Any) {
        pageNumber += 1;
        
        if pageNumber == 3 {
            // 화면 전환할 뷰 컨트롤러를 Storyboard ID 정보를 이용, 읽어와서 객체로 생성함
            if let view = self.storyboard?.instantiateViewController(withIdentifier: "ResultView") {
                // 화면을 전환함
                self.navigationController?.pushViewController(view, animated: false)
            }
        }
        else {
            self.sendData()
        }
    }
    
    
//    func setQuestionSound() {
////        for i in
//        soundName = "5.app-record_start"
//        initializePlayer(soundName: soundName)
//        self.audioPlayer?.play()
//    }
//
 
    // MARK: - Methods
    // MARK: - Custom Method
    func initializePlayer() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: soundName) else {
            print("음원 파일 에셋을 가져올 수 없습니다")
            return
        }
        
        do {
            try self.audioPlayer = AVAudioPlayer(data: soundAsset.data)
            self.audioPlayer.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
    }
    
    
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton) {
        
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
        self.replayButton.isSelected = false
    }

}
