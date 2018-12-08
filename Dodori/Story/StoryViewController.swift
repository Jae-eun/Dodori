//
//  StoryViewController.swift
//  Dodori
//
//  Created by SWUCOMPUTER on 2018. 6. 13..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import AVFoundation
import Lottie

class StoryViewController: UIViewController, AVAudioPlayerDelegate {
    
    // MARK:- Properties
    var audioPlayer: AVAudioPlayer?
    var audioPlayer2: AVAudioPlayer?
    var audioPlayer3: AVAudioPlayer?
    
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var storyImage: UIImageView!
    
    var pageNumber: Int = 0
    var testData: String = ""
    var storyImageName: String = ""
    var bgmName: String = ""
    var storySoundName: String = ""
    var effectSoundName: String = ""
    var animationView: LOTAnimationView = LOTAnimationView(name: " ")
    var storyPageNum: Int = 0
    var replayButton: UIButton = UIButton()
 
    
    
    // 메인화면으로 이동
    @IBAction func goHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: false)
        ViewData.shared.selectedReview = nil
    }
    
    func up(view: UIView) {
        view.center.y -= 110
        self.homeBtn.alpha = 0
    }
    
    func down(view: UIView) {
        view.center.y += 110
        self.homeBtn.alpha = 1
    }
 
//    func animate() {
//        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
//            self.up(view: self.homeBtn)
//            })    { (_) in
//                self.down(view: self.homeBtn)
//            }
//    }
    
    
    var homeButtonOn: Bool = true
    
    func showHomeButton() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            self.down(view: self.homeBtn)
        })
    }
    
    
    func hideHomeButton() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            self.up(view: self.homeBtn)
        })
    }

    
    @IBAction func tapped() {

        if homeButtonOn {
            self.hideHomeButton()
        } else {
            self.showHomeButton()
        }
        homeButtonOn = !homeButtonOn
    }

    
    
    @IBAction func previousPage(_ sender: Any) {
        pageNumber -= 1;
        self.sendData()
    }
    
    
    func putStoryPageNum() {
        if testData == "tino" {
            storyPageNum = StoryData.shared.tinoStory.count
        }
        else if testData == "yagu" {
            storyPageNum = StoryData.shared.yaguStory.count
        }
        else if testData == "paul" {
            storyPageNum = StoryData.shared.paulStory.count
        }
    }
    
    
    @IBAction func nextPage(_ sender: Any) {
        putStoryPageNum()
        pageNumber += 1;
        self.audioPlayer2?.pause()
        
        if pageNumber == storyPageNum {
            self.audioPlayer?.pause()
            
            // 화면 전환할 뷰 컨트롤러를 Storyboard ID 정보를 이용, 읽어와서 객체로 생성함
            if let view = self.storyboard?.instantiateViewController(withIdentifier: "LevelView") {
                // 화면을 전환합니다.
                self.navigationController?.pushViewController(view, animated: false)
            }
        }
        else {
            self.sendData()
        }
    }
    
    func receiveData() {
        if ViewData.shared.selectedStory == "tino" {
                testData = "tino"
        }
        else if ViewData.shared.selectedStory == "yagu" {
                testData = "yagu"
        }
        else if ViewData.shared.selectedStory == "paul" {
                testData = "paul"
        }
    }
    
    
    func sendData() {
        self.animationView.isHidden = true
        if pageNumber == 0 {
            previousBtn.isHidden = true
        } else {
            previousBtn.isHidden = false
        }

       if testData == "tino" {
            bgmName = "tinoStoryBgm_11"
            storyImageName = StoryData.shared.tinoStory[pageNumber]
            storyImage.image = UIImage(named: storyImageName)
            tinoAnimation(pageNum: pageNumber)
            storySoundName = StoryData.shared.tinoStorySound[pageNumber]
        }
        else if testData == "yagu" {
            bgmName = "yaguStoryBgm_12"
            storyImageName = StoryData.shared.yaguStory[pageNumber]
            storyImage.image = UIImage(named: storyImageName)
            yaguAnimation(pageNum: pageNumber)
            storySoundName = StoryData.shared.yaguStorySound[pageNumber]
        }
        else if testData == "paul" {
            bgmName = "paulStoryBgm_13"
            storyImageName = StoryData.shared.paulStory[pageNumber]
            storyImage.image = UIImage(named: storyImageName)
            paulAnimation(pageNum: pageNumber)
            storySoundName = StoryData.shared.paulStorySound[pageNumber]
        }
        self.storySoundPlayer()
        self.audioPlayer2?.play()
    }
    
    
    func setIntroPopUp() {
        let popUpView = IntroPopUp.instanceFromNib()
        popUpView.frame = self.view.frame
        self.view.addSubview(popUpView)
    }
    
    func intro() {
        guard let storyboardId = self.restorationIdentifier else { return }
        
        guard let vc =
            storyboard?.instantiateViewController(withIdentifier: "IntroView") as? IntroViewController else { return }
        vc.labelText = ViewData.shared.changeLabel(storyBoardId: storyboardId)
        vc.view.backgroundColor = UIColor(white: 0, alpha: 0.75)
        vc.modalPresentationStyle = .overCurrentContext
        
        self.present(vc, animated: false, completion: nil)
    }
    
    
    func startStory() {
        self.storySoundPlayer()
        self.audioPlayer2?.play()
    }
    
    func setTapGesture() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(StoryViewController.tapped))
        //        doubleTap.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(doubleTap)
    }
    
    
    // MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()

        intro()

        receiveData()
        sendData()
        setTapGesture()
        
        
        self.initializePlayer()
        self.audioPlayer?.play()
        self.audioPlayer?.numberOfLoops = 1
        self.audioPlayer?.volume = 0.2
        
        audioPlayer3?.prepareToPlay()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.audioPlayer2?.prepareToPlay()
    }

    
    // MARK: - Methods
    // MARK: - Custom Method
    func initializePlayer() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: bgmName) else {
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
    
    func storySoundPlayer() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: storySoundName) else {
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
    
    func effectSoundPlayer() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: effectSoundName) else {
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
    
    /*
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            self.player?.play()
        } else {
            self.player?.pause()
        }
        
    }
    */
    
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
    
//    func audioPlayerDidFinishPlaying(_ Player: AVAudioPlayer, successgully flag: Bool) {
//        self.playPauseButton.isSelected = false
 //   }
    
    @objc func buttonAction(sender: UIButton!) {
        self.effectSoundPlayer()
        self.audioPlayer?.play()
        animationView.play()
//        playEffectSound(SoundName: effectSoundName)

    }
    
    @objc func nextButtonAction(sender: UIButton!) {
        nextPage(UIButton())
    }
    
    @objc func previousButtonAction(sender: UIButton!) {
        previousPage(UIButton())
    }
    
}
