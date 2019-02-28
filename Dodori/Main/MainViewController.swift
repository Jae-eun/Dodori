//
//  MainViewController.swift
//  Dodori
//
//  Created by 이재은 on 2018. 7. 29..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import Lottie
import AVFoundation

class MainViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var yaguReviewBtn: UIButton!
    @IBOutlet weak var tinoReviewBtn: UIButton!
    @IBOutlet weak var paulReviewBtn: UIButton!
    
    var soundName: String = ""
    var effectSoundName: String = ""
    
    @IBAction func tinoBtn(_ sender: Any) {
        ViewData.shared.selectedStory = "tino"
        self.audioPlayer?.pause()
        pressedStoryBtn()
        self.changeView()
    }
        
    @IBAction func goTinoReview(_ sender: Any) {
        ViewData.shared.selectedStory = "tino"
        ViewData.shared.selectedReview = "isReview"
        self.audioPlayer?.pause()
        pressedPopupBtn()
        self.changeReviewView()
    }
    
    @IBAction func yaguBtn(_ sender: Any) {
        ViewData.shared.selectedStory = "yagu"
        self.audioPlayer?.pause()
        pressedStoryBtn()
        self.changeView()
    }
    
    @IBAction func goYaguReview(_ sender: Any) {
        ViewData.shared.selectedStory = "yagu"
        ViewData.shared.selectedReview = "isReview"
        self.audioPlayer?.pause()
        pressedPopupBtn()
        self.changeReviewView()
    }
    
    
    @IBAction func paulBtn(_ sender: Any) {
        ViewData.shared.selectedStory = "paul"
        self.audioPlayer?.pause()
        pressedStoryBtn()
        self.changeView()
    }

    @IBAction func goPaulReview(_ sender: Any) {
        ViewData.shared.selectedStory = "paul"
        ViewData.shared.selectedReview = "isReview"
        self.audioPlayer?.pause()
        pressedPopupBtn() 
        self.changeReviewView()
    }
    
    
    func changeView() {
        if let view = self.storyboard?.instantiateViewController(withIdentifier: "StoryView") {
            self.navigationController?.pushViewController(view, animated: false)
        }
    }
    
    @IBAction func yaguStoryPopUp(_ sender: Any) {
        ViewData.shared.selectedStory = "yagu"
        storyPopUp()
    }
    
    @IBAction func tinoStoryPopUp(_ sender: Any) {
        ViewData.shared.selectedStory = "tino"
        storyPopUp()
    }
    
    @IBAction func paulStoryPopUp(_ sender: Any) {
        ViewData.shared.selectedStory = "paul"
        storyPopUp()
    }
    
    
    func changeReviewView() {
        if let view = self.storyboard?.instantiateViewController(withIdentifier: "LevelView") {
            self.navigationController?.pushViewController(view, animated: false)
        }
    }
    
    func hiddenReviewBtn() {
        if ReviewData.shared.tinoEasyWordReview == [] {
            if ReviewData.shared.tinoHardWordReview == [] {
                tinoReviewBtn.isHidden = true
            }
        } else {
            tinoReviewBtn.isHidden = false
        }
        if ReviewData.shared.yaguEasyWordReview == [] {
            if ReviewData.shared.yaguHardWordReview == [] {
                yaguReviewBtn.isHidden = true
            }
        } else {
            yaguReviewBtn.isHidden = false
        }
        if ReviewData.shared.paulEasyWordReview == [] {
            if ReviewData.shared.paulHardWordReview == [] {
                paulReviewBtn.isHidden = true
            }
        } else {
            paulReviewBtn.isHidden = false
        }
    }
    
    
    func storyPopUp() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        guard let vc =
            storyboard.instantiateViewController(withIdentifier: "StoryPopUpView") as? StoryPopUpViewController else { return }
        
        vc.view.backgroundColor = UIColor(white: 0, alpha: 0.75)
        vc.modalPresentationStyle = .overCurrentContext
        
        self.present(vc, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        audioPlayer?.prepareToPlay()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        playBGM()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    var audioPlayer: AVAudioPlayer?
    var audioPlayer2: AVAudioPlayer?
    
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

    func pressedStoryBtn() {
        effectSoundName = "4.app-story_select"
        effectSoundPlayer()
        self.audioPlayer2?.play()
    }
    
    func pressedPopupBtn() {
        effectSoundName = "2.app-popup"
        effectSoundPlayer()
        self.audioPlayer2?.play()
    }
    
    func playBGM() {
        soundName = "3.app-Lovable_Clown_Sit_Com"
        self.audioPlayer?.volume = SettingData.shared.mainBgmSoundVolume
        initializePlayer()
        self.audioPlayer?.play()
        self.audioPlayer?.numberOfLoops = -1
    }
    
    
}
