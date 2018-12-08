//
//  LevelViewController.swift
//  Dodori
//
//  Created by 이재은 on 2018. 7. 29..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import AVFoundation

class LevelViewController: UIViewController {

    let Data0 = LevelData()
    var testData = ViewData.shared.selectedStory
    var soundName: String = ""
    
//    let stepData = ViewData.shared.selectedStory
    let isReview = ViewData.shared.selectedReview
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var storyTitle: UIImageView!
    
    
    // 메인화면으로 이동
    @IBAction func goHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: false)
        ViewData.shared.selectedReview = nil
    }
    
    
//    func receiveData() {
//        let stepData = ViewData.shared.selectedStory
//
//        switch stepData {
//            case "tino" :
//                testData = "tino"
//            case "yagu" :
//                testData = "yagu"
//            default :
//                testData = "paul"
//        }
//    }
    

    func sendData() {
        if testData == "tino" {
            let background: String = Data0.backgroundImage[0]
            backgroundImage.image = UIImage(named: background)
            let title: String = Data0.storyTitle[0]
            storyTitle.image = UIImage(named: title)
        }

        else if testData == "yagu" {
            let background: String = Data0.backgroundImage[1]
            backgroundImage.image = UIImage(named: background)
            let title: String = Data0.storyTitle[1]
            storyTitle.image = UIImage(named: title)
        }

        else if testData == "paul" {
            let background: String = Data0.backgroundImage[2]
            backgroundImage.image = UIImage(named: background)
            let title: String = Data0.storyTitle[2]
            storyTitle.image = UIImage(named: title)
        }
    }
    
    
    
    @IBAction func EasyBtn(_ sender: Any) {
        ViewData.shared.selectedLevel = "easy"
        
        pressedBtn()
        
        if isReview != nil {
            changeReviewView()
        } else {
            changeView()
        }
    }
    
    
    @IBAction func HardBtn(_ sender: Any) {
        ViewData.shared.selectedLevel = "hard"
        pressedBtn()
        if isReview != nil {
            changeReviewView()
        } else {
            changeView()
        }
    }
    
    
    func changeView() {
        if let view = self.storyboard?.instantiateViewController(withIdentifier: "Test1View") {
            self.navigationController?.pushViewController(view, animated:false)
        }
    }
    
    
    func changeReviewView() {
        if let view = self.storyboard?.instantiateViewController(withIdentifier: "ReviewView") {
            self.navigationController?.pushViewController(view, animated:false)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        receiveData()
        sendData()
        audioPlayer?.prepareToPlay()
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
    
    func pressedBtn() {
        soundName = "1.app-button"
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
