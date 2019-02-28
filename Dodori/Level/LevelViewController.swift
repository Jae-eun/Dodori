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
    
    var testData = ViewData.shared.selectedStory
    var soundName: String = ""
    var backgroundImageName: String = ""
    var titleName: String = ""
    var easyScoreImageName: String = ""
    var hardScoreImageName: String = ""
    
//    let stepData = ViewData.shared.selectedStory
    let isReview = ViewData.shared.selectedReview
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var easyStarScoreImageView: UIImageView?
    @IBOutlet weak var hardStarScoreImageView: UIImageView?
    @IBOutlet weak var storyTitleImageView: UIImageView?
    
    // 메인화면으로 이동
    @IBAction func goHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: false)
        ViewData.shared.selectedReview = nil
    }


    func sendData() {
        if testData == "tino" {
            backgroundImageName = LevelData.shared.backgroundImage[0]
            backgroundImage.image = UIImage(named: backgroundImageName)
            titleName = LevelData.shared.storyTitle[0]
            storyTitleImageView?.image = UIImage(named: titleName)
        }

        else if testData == "yagu" {
            backgroundImageName = LevelData.shared.backgroundImage[1]
            backgroundImage.image = UIImage(named: backgroundImageName)
            titleName = LevelData.shared.storyTitle[1]
            storyTitleImageView?.image = UIImage(named: titleName)
        }

        else if testData == "paul" {
            backgroundImageName = LevelData.shared.backgroundImage[2]
            backgroundImage.image = UIImage(named: backgroundImageName)
            titleName = LevelData.shared.storyTitle[2]
            storyTitleImageView?.image = UIImage(named: titleName)
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
    
    func setScoreImage() {
        if testData == "yagu" {
            easyScoreImageName = "levelStar\(ResultData.shared.yaguEasyScore)"
            hardScoreImageName = "levelStar\(ResultData.shared.yaguHardScore)"
        } else if testData == "tino" {
            easyScoreImageName = "levelStar\(ResultData.shared.tinoEasyScore)"
            hardScoreImageName = "levelStar\(ResultData.shared.tinoHardScore)"
        } else if testData == "paul" {
            easyScoreImageName = "levelStar\(ResultData.shared.paulEasyScore)"
            hardScoreImageName = "levelStar\(ResultData.shared.paulHardScore)"
        } else {
            easyScoreImageName = "levelStar0"
            hardScoreImageName = "levelStar0"
        }
        easyStarScoreImageView?.image = UIImage(named: easyScoreImageName)
        hardStarScoreImageView?.image = UIImage(named: hardScoreImageName)
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
    
    override func viewWillAppear(_ animated: Bool) {
        setScoreImage()
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
}
