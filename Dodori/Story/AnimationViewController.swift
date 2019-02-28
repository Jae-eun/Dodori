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
    
    public func addHomeButton() {
        button = UIButton(frame: CGRect(x: 887, y: 0, width: 90, height: 103))
        button.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    public func addPreviousPageButton() {
        button = UIButton(frame: CGRect(x: 0, y: 330, width: 100, height: 130))
        button.addTarget(self, action: #selector(previousButtonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    public func addNextPageButton() {
        button = UIButton(frame: CGRect(x: 924, y: 330, width: 100, height: 130))
        button.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    func playEffectSound(SoundName: String) {
        self.effectSoundPlayer()
        self.audioPlayer3?.play()
    }

    @objc func buttonAction(sender: UIButton!) {
        playEffectSound(SoundName: effectSoundName)
        animationView.pause()
    }
    
    @objc func nextButtonAction(sender: UIButton!) {
        nextPage(UIButton())
    }
    
    @objc func previousButtonAction(sender: UIButton!) {
        previousPage(UIButton())
    }
    
    
    
    public func yaguAnimation(pageNum: Int) {
        
        if pageNum == 1 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "yagu_2_anim")
            animationView.frame = CGRect(x: 405, y: 213, width: 219, height: 213)
            self.view.addSubview(animationView)
            animationView.play()

            animationView.loopAnimation = true
            effectSoundName = "1.yagu-boyon"
            replayButton = UIButton(frame: CGRect(x: 405, y: 216, width: 219, height: 213))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)

            addNextPageButton()
        } else if pageNum == 3 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "yagu_4_anim")
            animationView.frame = CGRect(x: 471, y: 0, width: 528, height: 477)
            self.view.addSubview(animationView)
            animationView.play()
            animationView.loopAnimation = true
            effectSoundName = "2.yagu-yaho"
            replayButton = UIButton(frame: CGRect(x: 471, y: 0, width: 528, height: 477))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            
            addPreviousPageButton()
            addNextPageButton()
        } else if pageNum == 7 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "yagu_8_anim")
            animationView.frame = CGRect(x: 80, y: 43, width: 335, height: 565)
            self.view.addSubview(animationView)
            animationView.play()
            animationView.loopAnimation = true
            effectSoundName = "3.yagu-crunch"
            replayButton = UIButton(frame: CGRect(x: 80, y: 43, width: 335, height: 565))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            
            addPreviousPageButton()
            addNextPageButton()
        } else if pageNum == 10 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "yagu_11_anim")
            animationView.frame = CGRect(x: 692, y: 320, width: 258, height: 250)
            self.view.addSubview(animationView)
            animationView.play()
            animationView.loopAnimation = true
             effectSoundName = "4.yagu-roll"
            replayButton = UIButton(frame: CGRect(x: 692, y: 320, width: 258, height: 250))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
           
            addPreviousPageButton()
            addNextPageButton()
        } else if pageNum == 15 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "yagu_16_anim")
            animationView.frame = CGRect(x: 553, y: 263, width: 396, height: 380)
            self.view.addSubview(animationView)
            animationView.play()
            animationView.loopAnimation = true
            effectSoundName = "6.yagu-ball"
            replayButton = UIButton(frame: CGRect(x: 553, y: 263, width: 396, height: 380))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            addPreviousPageButton()
            addNextPageButton()
        } else if pageNum == 19 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "yagu_20_anim")
            animationView.frame = CGRect(x: 161, y: 119, width: 440, height: 210)
            self.view.addSubview(animationView)
            animationView.play()
            animationView.loopAnimation = true
            effectSoundName = "8.yagu-brush"
            replayButton = UIButton(frame: CGRect(x: 161, y: 119, width: 440, height: 210))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            addPreviousPageButton()
            addNextPageButton()
        } else if pageNum == 23 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "yagu_24_anim")
            animationView.frame = CGRect(x: 175, y: 18, width: 628, height: 450)
            self.view.addSubview(animationView)
            animationView.play()
            animationView.loopAnimation = true
            effectSoundName = "9.yagu-bat"
            replayButton = UIButton(frame: CGRect(x: 175, y: 18, width: 628, height: 450))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            addPreviousPageButton()
            addNextPageButton()
        } else {

            animationView.removeFromSuperview()
            replayButton.removeFromSuperview()
        }
        
    }
    

    
    public func tinoAnimation(pageNum: Int) {

        if pageNum == 1 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "tino_2_anim")
            animationView.frame = CGRect(x: 97, y: 343, width: 272, height: 413)
            self.view.addSubview(animationView)
            animationView.play()
            animationView.loopAnimation = true
            effectSoundName = "1.tino-heartbeat"
            replayButton = UIButton(frame: CGRect(x: 97, y: 343, width: 272, height: 413))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            addNextPageButton()
        } else if pageNum == 3 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "tino_4_anim")
            animationView.frame = CGRect(x: 473, y: 41, width: 150, height: 226)
            self.view.addSubview(animationView)
            animationView.play()
            animationView.loopAnimation = true
            effectSoundName = "2.tino-question2"
            replayButton = UIButton(frame: CGRect(x: 473, y: 41, width: 150, height: 226))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            addPreviousPageButton()
            addNextPageButton()
        } else if pageNum == 4 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "tino_5_anim")
            animationView.frame = CGRect(x: 248, y: 252, width: 776, height: 516)
            self.view.addSubview(animationView)
            animationView.play()
            animationView.loopAnimation = true
            effectSoundName = "3.tino-new"
            replayButton = UIButton(frame: CGRect(x: 248, y: 252, width: 776, height: 516))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            addPreviousPageButton()
            addNextPageButton()
        } else if pageNum == 7 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "tino_8_anim")
            animationView.frame = CGRect(x: 97, y: 127, width: 508, height: 423)
            self.view.addSubview(animationView)
            animationView.play()
            animationView.loopAnimation = true
            effectSoundName = "3.tino-new"
            replayButton = UIButton(frame: CGRect(x: 97, y: 127, width: 508, height: 423))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            addPreviousPageButton()
            addNextPageButton()
        } else if pageNum == 8 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "tino_9_anim")
            animationView.frame = CGRect(x: 474, y: 31, width: 516, height: 507)
            self.view.addSubview(animationView)
            animationView.play()
            animationView.loopAnimation = true
            effectSoundName = "4.tino-appear"
            replayButton = UIButton(frame: CGRect(x: 474, y: 31, width: 516, height: 507))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            addPreviousPageButton()
            addNextPageButton()
        } else if pageNum == 9 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "tino_10_anim")
            animationView.frame = CGRect(x: 103, y: 30, width: 818, height: 608)
            self.view.addSubview(animationView)
            animationView.play()
            animationView.loopAnimation = true
            effectSoundName = "tino_3_10"
            replayButton = UIButton(frame: CGRect(x: 103, y: 30, width: 818, height: 608))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            addPreviousPageButton()
            addNextPageButton()
        } else if pageNum == 16 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "tino_17_anim")
            animationView.frame = CGRect(x: 548, y: 51, width: 452, height: 320)
            self.view.addSubview(animationView)
            animationView.play()
            animationView.loopAnimation = true
            effectSoundName = "7.tino-laugh"
            replayButton = UIButton(frame: CGRect(x: 548, y: 51, width: 452, height: 320))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            addPreviousPageButton()
            addNextPageButton()
        } else {
            //  LOTAnimationView.willRemoveSubview(animationView)
            //  LOTAnimationView.delete(animationView)
            animationView.removeFromSuperview()
            replayButton.removeFromSuperview()
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
            animationView.loopAnimation = true
            replayButton = UIButton(frame: CGRect(x: 400, y: 108, width: 543, height: 487))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            addNextPageButton()
            effectSoundName = "1.paul-crowd"
        } else if pageNum == 1 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "paul_2_anim")
            animationView.frame = CGRect(x: 298, y: 0, width: 473, height: 636)
            self.view.addSubview(animationView)
            animationView.play()
            animationView.loopAnimation = true
            replayButton = UIButton(frame: CGRect(x: 298, y: 0, width: 473, height: 636))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            effectSoundName = "2.paul-kitchen"
            addPreviousPageButton()
            addNextPageButton()
        } else if pageNum == 2 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "paul_3_anim")
            animationView.frame = CGRect(x: 226, y: 263, width: 489, height: 301)
            self.view.addSubview(animationView)
            animationView.play()
            animationView.loopAnimation = true
            replayButton = UIButton(frame: CGRect(x: 226, y: 263, width: 489, height: 301))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            effectSoundName = "3.paul-plastic_bag"
            addPreviousPageButton()
            addNextPageButton()
        } else if pageNum == 7 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "paul_8_anim")
            animationView.frame = CGRect(x: 507, y: 283, width: 431, height: 426)
            self.view.addSubview(animationView)
            animationView.play()
            animationView.loopAnimation = true
            replayButton = UIButton(frame: CGRect(x: 507, y: 283, width: 431, height: 426))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            effectSoundName = "4.paul-wind"
            addPreviousPageButton()
            addNextPageButton()
        } else if pageNum == 8 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "paul_9_anim")
            animationView.frame = CGRect(x: 0, y: 98, width: 1023, height: 670)
            self.view.addSubview(animationView)
            animationView.play()
            animationView.loopAnimation = true
            replayButton = UIButton(frame: CGRect(x: 0, y: 98, width: 1023, height: 670))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            effectSoundName = "5.paul-snow_walk"
            addPreviousPageButton()
            addNextPageButton()
        } else if pageNum == 15 {
            animationView.removeFromSuperview()
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "paul_16_anim")
            animationView.frame = CGRect(x: 163, y: 379, width: 255, height: 191)
            self.view.addSubview(animationView)
            animationView.play()
            animationView.loopAnimation = true
            replayButton = UIButton(frame: CGRect(x: 163, y: 379, width: 255, height: 191))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            effectSoundName = "6.paul-water_jump"
            addPreviousPageButton()
            addNextPageButton()
        } else if pageNum == 16 {
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "paul_17_anim")
            animationView.frame = CGRect(x: 543, y: 351, width: 172, height: 177)
            self.view.addSubview(animationView)
            animationView.play()
            animationView.loopAnimation = true
            replayButton = UIButton(frame: CGRect(x: 543, y: 351, width: 172, height: 177))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            effectSoundName = "7.paul-star"
            addPreviousPageButton()
            addNextPageButton()
        } else if pageNum == 33 {
            self.animationView.isHidden = false
            animationView = LOTAnimationView(name: "paul_34_anim")
            animationView.frame = CGRect(x: 289, y: 233, width: 485, height: 473)
            self.view.addSubview(animationView)
            animationView.play()
            animationView.loopAnimation = true
            replayButton = UIButton(frame: CGRect(x: 289, y: 233, width: 485, height: 473))
            replayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(replayButton)
            effectSoundName = "8.paul-clock"
            addPreviousPageButton()
            addNextPageButton()
        } else {
            animationView.removeFromSuperview()
            replayButton.removeFromSuperview()
        }
    
    }
}
