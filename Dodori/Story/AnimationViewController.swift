//
//  AnimationViewController.swift
//  Dodori
//
//  Created by 이재은 on 2018. 8. 19..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import Lottie

extension StoryViewController {
    
    public func addPreviousPageButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 330, width: 100, height: 130))
        button.addTarget(self, action: #selector(previousButtonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    public func addNextPageButton() {
        let button = UIButton(frame: CGRect(x: 924, y: 330, width: 100, height: 130))
        button.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    public func yaguAnimation(pageNum: Int) {
        
        if pageNum == 1 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "yagu_2_anim")
            animationView.frame = CGRect(x: 405, y: 216, width: 219, height: 213)
            self.view.addSubview(animationView)
            animationView.play()
            replayButton = UIButton(frame: CGRect(x: 405, y: 216, width: 219, height: 213))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            addNextPageButton()
        }
        else if pageNum == 3 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "yagu_4_anim")
            animationView.frame = CGRect(x: 471, y: 0, width: 528, height: 477)
            self.view.addSubview(animationView)
            animationView.play()
            replayButton = UIButton(frame: CGRect(x: 471, y: 0, width: 528, height: 477))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            addPreviousPageButton()
            addNextPageButton()
        }
        else if pageNum == 7 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "yagu_8_anim")
            animationView.frame = CGRect(x: 80, y: 43, width: 335, height: 565)
            self.view.addSubview(animationView)
            animationView.play()
            replayButton = UIButton(frame: CGRect(x: 80, y: 43, width: 335, height: 565))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            addPreviousPageButton()
            addNextPageButton()
        }
        else if pageNum == 10 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "yagu_11_anim")
            animationView.frame = CGRect(x: 692, y: 320, width: 258, height: 250)
            self.view.addSubview(animationView)
            animationView.play()
            replayButton = UIButton(frame: CGRect(x: 692, y: 320, width: 258, height: 250))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            addPreviousPageButton()
            addNextPageButton()
        }
        else if pageNum == 15 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "yagu_16_anim")
            animationView.frame = CGRect(x: 553, y: 263, width: 396, height: 380)
            self.view.addSubview(animationView)
            animationView.play()
            replayButton = UIButton(frame: CGRect(x: 553, y: 263, width: 396, height: 380))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            addPreviousPageButton()
            addNextPageButton()
        }
        else if pageNum == 19 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "yagu_20_anim")
            animationView.frame = CGRect(x: 161, y: 119, width: 440, height: 210)
            self.view.addSubview(animationView)
            animationView.play()
            replayButton = UIButton(frame: CGRect(x: 161, y: 119, width: 440, height: 210))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            addPreviousPageButton()
            addNextPageButton()
        }
        else if pageNum == 23 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "yagu_24_anim")
            animationView.frame = CGRect(x: 175, y: 18, width: 628, height: 450)
            self.view.addSubview(animationView)
            animationView.play()
            replayButton = UIButton(frame: CGRect(x: 175, y: 18, width: 628, height: 450))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            addPreviousPageButton()
            addNextPageButton()
        }
        else {
            //  LOTAnimationView.willRemoveSubview(animationView)
            //  LOTAnimationView.delete(animationView)
            animationView.removeFromSuperview()
        }
        
    }
    
    func playEffectSound(SoundName: String) {
        self.effectSoundPlayer()
        self.audioPlayer?.play()
    }
    
    public func tinoAnimation(pageNum: Int) {
        
        if pageNum == 1 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "tino_2_anim")
            animationView.frame = CGRect(x: 97, y: 343, width: 272, height: 413)
            self.view.addSubview(animationView)
            animationView.play()
            replayButton = UIButton(frame: CGRect(x: 97, y: 343, width: 272, height: 413))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            effectSoundName = "2.tino_heartbeat"
            addNextPageButton()
        }
        else if pageNum == 3 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "tino_4_anim")
            animationView.frame = CGRect(x: 473, y: 41, width: 150, height: 226)
            self.view.addSubview(animationView)
            animationView.play()
            replayButton = UIButton(frame: CGRect(x: 473, y: 41, width: 150, height: 226))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            effectSoundName = "4.tino_question2"
            addPreviousPageButton()
            addNextPageButton()
        }
        else if pageNum == 4 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "tino_5_anim")
            animationView.frame = CGRect(x: 248, y: 252, width: 776, height: 516)
            self.view.addSubview(animationView)
            animationView.play()
            replayButton = UIButton(frame: CGRect(x: 248, y: 252, width: 776, height: 516))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            effectSoundName = "4.tino_question2"
            addPreviousPageButton()
            addNextPageButton()
        }
        else if pageNum == 7 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "tino_8_anim")
            animationView.frame = CGRect(x: 97, y: 127, width: 508, height: 423)
            self.view.addSubview(animationView)
            animationView.play()
            replayButton = UIButton(frame: CGRect(x: 97, y: 127, width: 508, height: 423))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            effectSoundName = "8.tino_new"
            addPreviousPageButton()
            addNextPageButton()
        }
        else if pageNum == 8 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "tino_9_anim")
            animationView.frame = CGRect(x: 474, y: 31, width: 516, height: 507)
            self.view.addSubview(animationView)
            animationView.play()
            replayButton = UIButton(frame: CGRect(x: 474, y: 31, width: 516, height: 507))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            effectSoundName = "11.tino_appear"
            addPreviousPageButton()
            addNextPageButton()
        }
        else if pageNum == 9 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "tino_10_anim")
            animationView.frame = CGRect(x: 103, y: 30, width: 818, height: 608)
            self.view.addSubview(animationView)
            animationView.play()
            replayButton = UIButton(frame: CGRect(x: 103, y: 30, width: 818, height: 608))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            effectSoundName = "16.tino_scream"
            addPreviousPageButton()
            addNextPageButton()
        }
        else if pageNum == 11 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "tino_12_anim")
            animationView.frame = CGRect(x: 96, y: 5, width: 920, height: 673)
            self.view.addSubview(animationView)
            animationView.play()
            replayButton = UIButton(frame: CGRect(x: 96, y: 5, width: 920, height: 673))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            effectSoundName = "20.tino_cute_dino"
            addPreviousPageButton()
            addNextPageButton()
        }
        else if pageNum == 16 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "tino_17_anim")
            animationView.frame = CGRect(x: 548, y: 51, width: 452, height: 320)
            self.view.addSubview(animationView)
            animationView.play()
            replayButton = UIButton(frame: CGRect(x: 548, y: 51, width: 452, height: 320))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            effectSoundName = "24.tino_laugh"
            addPreviousPageButton()
            addNextPageButton()
        }
        else {
            //  LOTAnimationView.willRemoveSubview(animationView)
            //  LOTAnimationView.delete(animationView)
            animationView.removeFromSuperview()
        }
        
    }

    
    public func paulAnimation(pageNum: Int) {
        
        if pageNum == 0 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "paul_1_anim")
            animationView.frame = CGRect(x: 380, y: 18, width: 633, height: 647)
            self.view.addSubview(animationView)
            animationView.play()
            replayButton = UIButton(frame: CGRect(x: 380, y: 18, width: 272, height: 647))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            addNextPageButton()
            effectSoundName = "2.tino_heartbeat"
        }
        else if pageNum == 1 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "paul_2_anim")
            animationView.frame = CGRect(x: 298, y: 0, width: 473, height: 636)
            self.view.addSubview(animationView)
            animationView.play()
            replayButton = UIButton(frame: CGRect(x: 298, y: 0, width: 473, height: 636))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            effectSoundName = "4.tino_question2"
            addPreviousPageButton()
            addNextPageButton()
        }
        else if pageNum == 2 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "paul_3_anim")
            animationView.frame = CGRect(x: 226, y: 263, width: 489, height: 301)
            self.view.addSubview(animationView)
            animationView.play()
            replayButton = UIButton(frame: CGRect(x: 226, y: 263, width: 489, height: 301))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            addPreviousPageButton()
            addNextPageButton()
        }
        else if pageNum == 7 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "paul_8_anim")
            animationView.frame = CGRect(x: 507, y: 283, width: 431, height: 426)
            self.view.addSubview(animationView)
            animationView.play()
            replayButton = UIButton(frame: CGRect(x: 507, y: 283, width: 431, height: 426))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            effectSoundName = "8.tino_new"
            addPreviousPageButton()
            addNextPageButton()
        }
        else if pageNum == 8 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "paul_9_anim")
            animationView.frame = CGRect(x: 0, y: 98, width: 1023, height: 670)
            self.view.addSubview(animationView)
            animationView.play()
            replayButton = UIButton(frame: CGRect(x: 0, y: 98, width: 1023, height: 670))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            addPreviousPageButton()
            addNextPageButton()
        }
//        else if pageNum == 9 {
//            animationView.removeFromSuperview()
//            self.animationView.isHidden = false
//            animationView = LOTAnimationView(name: "paul_10_anim")
//            animationView.frame = CGRect(x: 103, y: 30, width: 818, height: 608)
//            self.view.addSubview(animationView)
//            animationView.play()
//            replayButton = UIButton(frame: CGRect(x: 103, y: 30, width: 818, height: 608))
//            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//            self.view.addSubview(replayButton)
//            let button2 = UIButton(frame: CGRect(x: 926, y: 329, width: 130, height: 100))
//            button2.addTarget(self, action: #selector(nextbuttonAction), for: .touchUpInside)
//            self.view.addSubview(button2)
//            effectSoundName = "16.tino_scream"
//        }
//        else if pageNum == 11 {
//            self.animationView.isHidden = false
//            animationView = LOTAnimationView(name: "paul_12_anim")
//            animationView.frame = CGRect(x: 96, y: 5, width: 920, height: 673)
//            self.view.addSubview(animationView)
//            animationView.play()
//            replayButton = UIButton(frame: CGRect(x: 96, y: 5, width: 920, height: 673))
//            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//            self.view.addSubview(replayButton)
//            let button2 = UIButton(frame: CGRect(x: 926, y: 329, width: 130, height: 100))
//            button2.addTarget(self, action: #selector(nextbuttonAction), for: .touchUpInside)
//            self.view.addSubview(button2)
//            effectSoundName = "20.tino_cute_dino"
//        }
//        else if pageNum == 16 {
//            self.animationView.isHidden = false
//            animationView = LOTAnimationView(name: "paul_17_anim")
//            animationView.frame = CGRect(x: 548, y: 51, width: 452, height: 320)
//            self.view.addSubview(animationView)
//            animationView.play()
//            replayButton = UIButton(frame: CGRect(x: 548, y: 51, width: 452, height: 320))
//            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//            self.view.addSubview(replayButton)
//            effectSoundName = "24.tino_laugh"
//        }
        else {
            //  LOTAnimationView.willRemoveSubview(animationView)
            //  LOTAnimationView.delete(animationView)
            animationView.removeFromSuperview()
        }
        
    }
}
