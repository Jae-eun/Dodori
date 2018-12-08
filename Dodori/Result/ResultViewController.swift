//
//  ResultViewController.swift
//  Dodori
//
//  Created by 이재은 on 2018. 8. 17..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import Lottie
import AVFoundation

class ResultViewController: UIViewController {

    let DataEnd = ResultData()
    var testData: String = ""
    var soundName: String = ""
    
    @IBOutlet weak var backgroundImage: UIImageView!

    @IBOutlet weak var endBtn: UIButton!
    
    @IBOutlet weak var reviewBtn: UIButton!
    // 메인화면으로 이동

    
    @IBAction func finishTest(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: false)
        ViewData.shared.selectedReview = nil
    }
    
    
    @IBAction func goReview(_ sender: Any) {
        if let view = self.storyboard?.instantiateViewController(withIdentifier: "ReviewView") {
            self.navigationController?.pushViewController(view, animated:false)
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
        if testData == "tino" {
            let background: String = DataEnd.backgroundImage[0]
            backgroundImage.image = UIImage(named: background)
            let end: String = DataEnd.endBtnImage[0]
            endBtn.imageView?.image = UIImage(named: end)
            let review: String = DataEnd.reviewBtnImage[0]
            reviewBtn.imageView?.image = UIImage(named: review)
        }
            
        else if testData == "yagu" {
            let background: String = DataEnd.backgroundImage[1]
            backgroundImage.image = UIImage(named: background)
            let end: String = DataEnd.endBtnImage[1]
            endBtn.imageView?.image = UIImage(named: end)
            let review: String = DataEnd.reviewBtnImage[1]
            reviewBtn.imageView?.image = UIImage(named: review)
        }
            
        else if testData == "paul" {
            let background: String = DataEnd.backgroundImage[2]
            backgroundImage.image = UIImage(named: background)
            let end: String = DataEnd.endBtnImage[2]
            endBtn.imageView?.image = UIImage(named: end)
            let review: String = DataEnd.reviewBtnImage[2]
            reviewBtn.imageView?.image = UIImage(named: review)
        }
    }
    
    func starLottie() {
        let animationView = LOTAnimationView(name: "star_anim5")
//        animationView.frame = CGRect(x: 170, y: 115, width: 687, height: 300)
        animationView.frame = CGRect(x: 162, y: 110, width: 700, height: 250)
        self.view.addSubview(animationView)
        animationView.play()
        //        animationView.pause()
        //        animationView.willRemoveSubview(animationView)
        //                        nextPage()
        
    }
    
    
    
//    @IBAction func EasyBtn(_ sender: Any) {
//        ViewData.shared.selectedLevel = "easy"
//        changeView()
//    }
//
//    @IBAction func HardBtn(_ sender: Any) {
//        ViewData.shared.selectedLevel = "hard"
//        changeView()
//    }
//
//    func changeView() {
//        if let view = self.storyboard?.instantiateViewController(withIdentifier: "IntroView") {
//            self.navigationController?.pushViewController(view, animated:false)
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        receiveData()
        sendData()
        starLottie()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    func ShowStarLottie() {
        soundName = "10.app-result_star"
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
