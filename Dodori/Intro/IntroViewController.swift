//
//  IntroViewController.swift
//  Dodori
//
//  Created by 이재은 on 2018. 7. 29..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import Lottie
import AVFoundation

protocol StoryIntroDelegate: class {
    func playBackgroundSound()
    func passedStory()
}

protocol TestIntroDelegate: class {
    func bubbleDefaultLottie()
}

class IntroViewController: UIViewController, AVAudioPlayerDelegate {
    
    weak var storyIntroDelegate: StoryIntroDelegate?
    weak var testIntroDelegate: TestIntroDelegate?
    
    @IBOutlet weak var introSpeakingImageView: UIImageView!
    @IBOutlet weak var storyStartButton: UIButton!
    @IBOutlet weak var storyPassButton: UIButton!
    @IBOutlet weak var  startButton: UIButton!
    
    var speakingImageName: String = ""
    var soundName: String = ""
    var effectSoundName: String = ""
    var storyBoardId: String = ""
    var isStoryPage: Bool = false
    var audioPlayer: AVAudioPlayer?
    var audioPlayer2: AVAudioPlayer?
    public var animationView = LOTAnimationView()
    
    @IBAction func startBtn(_ sender: Any) {
        self.pressedBtn()
        testIntroDelegate?.bubbleDefaultLottie()
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func startStoryButton() {
        self.pressedBtn()
        storyIntroDelegate?.playBackgroundSound()
        self.dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func passedStoryBtn(_ sender: Any) {
        self.pressedBtn()
        storyIntroDelegate?.passedStory()
    }

    
    func dodoriLottie() {
        animationView = LOTAnimationView(name: "dodori_anim_test6")
        animationView.frame = CGRect(x: 166, y: 200, width: 334, height: 506)
        self.view.addSubview(animationView)
        animationView.play()
        animationView.loopAnimation = true
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        introSpeakingImageView?.image = UIImage(named: speakingImageName)
        
        dodoriLottie()
        initializePlayer()
        audioPlayer?.play()
        
        showStoryButton()
        // Do any additional setup after loading the view.
    }

    func showStoryButton() {
        if isStoryPage == true {
            storyStartButton.isHidden = false
            storyPassButton.isHidden = false
            startButton.isHidden = true
        } else {
            storyStartButton.isHidden = true
            storyPassButton.isHidden = true
            startButton.isHidden = false
        }
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
    
    func audioPlayerDidFinishPlaying(_ Player: AVAudioPlayer, successfully flag: Bool) {
        if flag == true {
            animationView.loopAnimation = false
        }
    }
    
    func pressedBtn() {
        soundName = "1.app-button"
        effectSoundPlayer()
        self.audioPlayer2?.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
