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

class MainViewController: UIViewController {
    
    @IBOutlet weak var yaguReviewBtn: UIButton!
    @IBOutlet weak var tinoReviewBtn: UIButton!
    @IBOutlet weak var paulReviewBtn: UIButton!
    
    var soundName: String = ""
    
    @IBOutlet weak var test: UIImageView!
    
    func image() {
//        test.layer.borderWidth = 1
        test.layer.masksToBounds = false
//        test.layer.borderColor = UIColor.black.cgColor
        test.layer.cornerRadius = test.frame.height/2
        test.clipsToBounds = true
    }
    @IBAction func tinoBtn(_ sender: Any) {
        ViewData.shared.selectedStory = "tino"
        pressedStoryBtn()
        self.changeView()
    }
        
    @IBAction func goTinoReview(_ sender: Any) {
        ViewData.shared.selectedStory = "tino"
        ViewData.shared.selectedReview = "isReview"
        pressedPopupBtn()
        self.changeReviewView()
    }
    
    @IBAction func yaguBtn(_ sender: Any) {
        ViewData.shared.selectedStory = "yagu"
        pressedStoryBtn()
        self.changeView()
    }
    
    @IBAction func goYaguReview(_ sender: Any) {
        ViewData.shared.selectedStory = "yagu"
        ViewData.shared.selectedReview = "isReview"
        pressedPopupBtn()
        self.changeReviewView()
    }
    
    
    @IBAction func paulBtn(_ sender: Any) {
        ViewData.shared.selectedStory = "paul"
        pressedStoryBtn()
        self.changeView()
    }

    @IBAction func goPaulReview(_ sender: Any) {
        ViewData.shared.selectedStory = "paul"
        ViewData.shared.selectedReview = "isReview"
        pressedPopupBtn() 
        self.changeReviewView()
    }
    
    
    func changeView() {
        if let view = self.storyboard?.instantiateViewController(withIdentifier: "StoryView") {
            self.navigationController?.pushViewController(view, animated: false)
        }
    }
    

    
//    func storyPopUp() {
//        let popUpView = StoryPopUp.instanceFromNib()
//
//
//        popUpView.frame = self.view.frame
//        self.view.addSubview(popUpView)
//    }
    
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
        if let view = self.storyboard?.instantiateViewController(withIdentifier: "ReviewView") {
            self.navigationController?.pushViewController(view, animated: false)
        }
    }
    
    func hiddenReviewBtn() {
        if Test1Data.shared.tinoEasyReview == [] {
            if Test1Data.shared.tinoHardReview == [] {
                tinoReviewBtn.isHidden = true
            }
        } else {
            tinoReviewBtn.isHidden = false
        }
        if Test1Data.shared.yaguEasyReview == [] {
            if Test1Data.shared.yaguHardReview == [] {
                yaguReviewBtn.isHidden = true
            }
        } else {
            yaguReviewBtn.isHidden = false
        }
        if Test1Data.shared.paulEasyReview == [] {
            if Test1Data.shared.paulHardReview == [] {
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
        
//        guard let storyName = ViewData.shared.selectedStory else { return }
//        storyPopUpImage.image = UIImage(named: PopUpData.shared.changeImage(storyName: storyName))
        
//        vc.storyPopUpImage.image = UIImage(named: )
        vc.view.backgroundColor = UIColor(white: 0, alpha: 0.75)
        vc.modalPresentationStyle = .overCurrentContext
        
        self.present(vc, animated: false, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//starLottie()
//        dodoriLottie()
        image()
        hiddenReviewBtn()
        // Do any additional setup after loading the view.
        audioPlayer?.prepareToPlay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func starLottie() {

        let animationView = LOTAnimationView(name: "star_anim1")
//        animationView.frame = CGRect(x: 169, y: 155, width: 687, height: 300)
        animationView.frame = CGRect(x: 162, y: 110, width: 700, height: 250)
        self.view.addSubview(animationView)
        animationView.play()
                print(animationView)
        //        animationView.pause()
        //        animationView.willRemoveSubview(animationView)
        //                        nextPage()
        
    }
    
    func dodoriLottie() {
        let animationView = LOTAnimationView(name: "dodori_anim")
        animationView.frame = CGRect(x: 166, y: 200, width: 329, height: 502)
        self.view.addSubview(animationView)
        animationView.play()
        //        animationView.pause()
        //        animationView.willRemoveSubview(animationView)
        //                        nextPage()
        
    }
    
    
    var audioPlayer: AVAudioPlayer?
    
    func initializePlayer(soundName: String) {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: soundName) else {
            print("음원 파일 에셋을 가져올 수 없습니다")
            return
        }
        do {
            try self.audioPlayer = AVAudioPlayer(data: soundAsset.data)
            self.audioPlayer!.delegate = self as? AVAudioPlayerDelegate
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
    }
    
//    func pressedStoryBtn() {
//        soundName = "yagugong1_1"
//        initializePlayer(soundName: soundName)
//    }
    
    func pressedStoryBtn() {
        soundName = "4.app-story_select"
        initializePlayer(soundName: soundName)
        self.audioPlayer?.play()
    }
    
    func pressedPopupBtn() {
        soundName = "2.app-popup"
        initializePlayer(soundName: soundName)
        self.audioPlayer?.play()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
