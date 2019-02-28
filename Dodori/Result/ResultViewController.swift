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

class ResultViewController: UIViewController, AVAudioPlayerDelegate {

    var testData: String = ""
    var soundName: String = ""
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var resultBoxImage: UIImageView!
    @IBOutlet weak var endBtn: UIButton!
    @IBOutlet weak var reviewBtn: UIButton!
    
    var audioPlayer: AVAudioPlayer?
    var backgroundImageName: String = ""
    var resultBoxImageName: String = ""
    var endButtonImageName: String = ""
    var reviewButtonImageName: String = ""
    var finalScore: Double = 0.0
    var numberOfStarsScore: Int = 0
    
    public var animationView = LOTAnimationView()

    
    @IBAction func finishTest(_ sender: Any) {
        self.audioPlayer?.pause()
        self.navigationController?.popToRootViewController(animated: false)
        ViewData.shared.selectedReview = nil
    }
    
    @IBAction func goReview(_ sender: Any) {
        self.audioPlayer?.pause()
        ViewData.shared.selectedReview = "isReview"
        if let view = self.storyboard?.instantiateViewController(withIdentifier: "ReviewView") {
            self.navigationController?.pushViewController(view, animated:false)
        }
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
        if testData == "tinoEasy" || testData == "tinoHard" {
            backgroundImageName = ResultData.shared.backgroundImage[0]
            backgroundImage.image = UIImage(named: backgroundImageName)
            endButtonImageName = ResultData.shared.endBtnImage[0]
            endBtn.imageView?.image = UIImage(named: endButtonImageName)
            reviewButtonImageName = ResultData.shared.reviewBtnImage[0]
            reviewBtn.imageView?.image = UIImage(named: reviewButtonImageName)
        }
            
        else if testData == "yaguEasy" || testData == "yaguHard" {
            backgroundImageName = ResultData.shared.backgroundImage[1]
            backgroundImage.image = UIImage(named: backgroundImageName)
            endButtonImageName = ResultData.shared.endBtnImage[1]
            endBtn.imageView?.image = UIImage(named: endButtonImageName)
            reviewButtonImageName = ResultData.shared.reviewBtnImage[1]
            reviewBtn.imageView?.image = UIImage(named: reviewButtonImageName)
        }
            
        else if testData == "paulEasy" || testData == "paulHard" {
            backgroundImageName = ResultData.shared.backgroundImage[2]
            backgroundImage.image = UIImage(named: backgroundImageName)
            endButtonImageName = ResultData.shared.endBtnImage[2]
            endBtn.imageView?.image = UIImage(named: endButtonImageName)
            reviewButtonImageName = ResultData.shared.reviewBtnImage[2]
            reviewBtn.imageView?.image = UIImage(named: reviewButtonImageName)
        }
        endBtn.setImage(endBtn?.imageView?.image, for: UIControlState.normal)
        reviewBtn.setImage(reviewBtn?.imageView?.image, for: UIControlState.normal)
    }
    
    func calculateScore() {
        print(ResultData.shared.solvedOpportunityScore)
        print(ResultData.shared.totalOpportunityScore)
        finalScore = Double(ResultData.shared.solvedOpportunityScore) / Double(ResultData.shared.totalOpportunityScore)
        finalScore *= 100
        print(finalScore)
    }
    
    func setResultBoxImage() {
        if finalScore >= 80 {
            resultBoxImageName = "result_1"
            numberOfStarsScore = 5
        } else if finalScore >= 60 && finalScore < 80 {
            resultBoxImageName = "result_2"
            numberOfStarsScore = 4
        } else if finalScore >= 40 && finalScore < 60 {
            resultBoxImageName = "result_3"
            numberOfStarsScore = 3
        } else if finalScore >= 20 && finalScore < 40 {
            resultBoxImageName = "result_4"
            numberOfStarsScore = 2
        } else {
            resultBoxImageName = "result_5"
            numberOfStarsScore = 1
        }
        resultBoxImage.image = UIImage(named: resultBoxImageName)
        saveNumberOfStarsScore()
    }
    
    func starLottie() {
        if finalScore >= 80 {
            animationView = LOTAnimationView(name: "star_anim5")
        } else if finalScore >= 60 && finalScore < 80 {
            animationView = LOTAnimationView(name: "star_anim4")
        } else if finalScore >= 40 && finalScore < 60 {
            animationView = LOTAnimationView(name: "star_anim3")
        } else if finalScore >= 20 && finalScore < 40 {
            animationView = LOTAnimationView(name: "star_anim2")
        } else {
            animationView = LOTAnimationView(name: "star_anim1")
        }
        animationView.frame = CGRect(x: 162, y: 110, width: 700, height: 250)
        self.view.addSubview(animationView)
        animationView.play(completion: {(true) in self.playResultSound()})
    }
    
    func playResultSound() {
        if finalScore >= 80 {
            soundName = "dodori_result_1"
        } else if finalScore >= 60 && finalScore < 80 {
            soundName = "dodori_result_2"
        } else if finalScore >= 40 && finalScore < 60 {
            soundName = "dodori_result_3"
        } else if finalScore >= 20 && finalScore < 40 {
            soundName = "dodori_result_4"
        } else {
            soundName = "dodori_result_5"
        }
        initializePlayer()
        self.audioPlayer?.play()
    }
    
    func saveNumberOfStarsScore() {
        if testData == "yaguEasy" {
            ResultData.shared.yaguEasyScore = numberOfStarsScore
        } else if testData == "yaguHard" {
            ResultData.shared.yaguHardScore = numberOfStarsScore
        } else if testData == "tinoEasy" {
            ResultData.shared.tinoEasyScore = numberOfStarsScore
        } else if testData == "tinoHard" {
            ResultData.shared.tinoHardScore = numberOfStarsScore
        } else if testData == "paulEasy" {
            ResultData.shared.paulEasyScore = numberOfStarsScore
        } else if testData == "paulHard" {
            ResultData.shared.paulHardScore = numberOfStarsScore
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        receiveData()
        sendData()
        calculateScore()
        setResultBoxImage()
        starLottie()
        playStarLottieSound()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
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

    func playStarLottieSound() {
        soundName = "10.app-result_star"
        initializePlayer()
        self.audioPlayer?.play()
    }
}
