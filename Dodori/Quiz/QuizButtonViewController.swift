//
//  QuizButtonViewController.swift
//  Dodori
//
//  Created by 이재은 on 14/10/2018.
//  Copyright © 2018 SWUCOMPUTER. All rights reserved.
//

import Foundation
import UIKit

extension QuizViewController {
    func animate(sender: UIButton) {
        
        let buttonSize: CGRect = sender.frame
        
        let originXbutton = buttonSize.origin.x
        let originYbutton = buttonSize.origin.y
        
        let originWidthbutton = buttonSize.size.width
        let originHeightbutton = buttonSize.size.height
        
        UIView.animate(withDuration: 0.2, animations: {
            sender.frame = CGRect(x: originXbutton - 10, y: originYbutton - 10, width: originWidthbutton * 1.5, height: originHeightbutton * 1.5)
        }, completion: { finished in
            sender.frame = CGRect(x: originXbutton, y: originYbutton, width: originWidthbutton, height: originHeightbutton)
        })
    }
    
    func expandSize(button: UIButton) {
        isBigSize = true
        button.imageEdgeInsets = UIEdgeInsetsMake(-23, -23, -23, -23)
    }
    
    func reduceSize(button: UIButton) {
        isBigSize = false
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func defaultButton() {
        self.reduceSize(button: self.firstBtn)
        self.reduceSize(button: self.secondBtn)
        self.reduceSize(button: self.thirdBtn)
        
        if isCorrect {
            self.firstBtn.setImage(UIImage(named: "stage4_1_default_Btn"), for: UIControlState.normal)
            self.secondBtn.setImage(UIImage(named: "stage4_2_default_Btn"), for: UIControlState.normal)
            self.thirdBtn.setImage(UIImage(named: "stage4_3_default_Btn"), for: UIControlState.normal)
        }
        else {
            self.firstBtn.setImage(UIImage(named: quizDictionary[shuffledExamples[0].soundName]!), for: UIControlState.normal)
            self.secondBtn.setImage(UIImage(named: quizDictionary[shuffledExamples[1].soundName]!), for: UIControlState.normal)
            self.thirdBtn.setImage(UIImage(named: quizDictionary[shuffledExamples[2].soundName]!), for: UIControlState.normal)
        }
        self.isBigSize = false
    }
    
    @IBAction func tappedFirstButton() {
        //        selectNumberButton(sender: firstBtn)
        //        animate(sender: firstBtn)
        isSolve = true
        userSelectedIndex = 0
        if isBigSize == false {
            UIButton.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
                self.expandSize(button: self.firstBtn)
                self.reduceSize(button: self.secondBtn)
                self.reduceSize(button: self.thirdBtn)
            })
            self.firstBtn.setImage(UIImage(named: "stage4_1_select_Btn"), for: UIControlState.normal)
            self.secondBtn.setImage(UIImage(named: "stage4_2_deselect_Btn"), for: UIControlState.normal)
            self.thirdBtn.setImage(UIImage(named: "stage4_3_deselect_Btn"), for: UIControlState.normal)
            self.isBigSize = true
        } else {
            //            UIButton.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            //                self.reduceSize(button: self.firstBtn)
            //            })
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.confirmAnswer()
        }
    }
    
    @IBAction func tappedSecondButton() {
        userSelectedIndex = 1
        isSolve = true
        if isBigSize == false {
            UIButton.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
                self.reduceSize(button: self.firstBtn)
                self.expandSize(button: self.secondBtn)
                self.reduceSize(button: self.thirdBtn)
            })
            self.firstBtn.setImage(UIImage(named: "stage4_1_deselect_Btn"), for: UIControlState.normal)
            self.secondBtn.setImage(UIImage(named: "stage4_2_select_Btn"), for: UIControlState.normal)
            self.thirdBtn.setImage(UIImage(named: "stage4_3_deselect_Btn"), for: UIControlState.normal)
            self.isBigSize = true
        } else {
            //            UIButton.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            //                self.reduceSize(button: self.secondBtn)
            //            })
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.confirmAnswer()
        }
    }
    
    @IBAction func tappedThirdButton() {
        userSelectedIndex = 2
        isSolve = true
        if isBigSize == false {
            UIButton.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
                self.reduceSize(button: self.firstBtn)
                self.reduceSize(button: self.secondBtn)
                self.expandSize(button: self.thirdBtn)
            })
            self.firstBtn.setImage(UIImage(named: "stage4_1_deselect_Btn"), for: UIControlState.normal)
            self.secondBtn.setImage(UIImage(named: "stage4_2_deselect_Btn"), for: UIControlState.normal)
            self.thirdBtn.setImage(UIImage(named: "stage4_3_select_Btn"), for: UIControlState.normal)
            self.isBigSize = true
        } else {
            //            UIButton.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            //                self.reduceSize(button: self.thirdBtn)
            //            })
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.confirmAnswer()
        }
    }
    
    func changeExampleButtonPlay() {
        print(playFileNumber)
        if playFileNumber == 0 {
            if isCorrect {
                self.firstBtn.setImage(UIImage(named: "stage4_1_default_Btn"), for: UIControlState.normal)
            }
            else {
                self.firstBtn.setImage(UIImage(named: quizDictionary[shuffledExamples[0].soundName]!), for: UIControlState.normal)
            }
            self.expandSize(button: self.firstBtn)
            self.secondBtn.setImage(UIImage(named: "stage4_2_deselect_Btn"), for: UIControlState.normal)
            self.thirdBtn.setImage(UIImage(named: "stage4_3_deselect_Btn"), for: UIControlState.normal)
            
        } else if playFileNumber == 1 {
            if isCorrect {
                self.firstBtn.setImage(UIImage(named: "stage4_1_deselect_Btn"), for: UIControlState.normal)
                self.secondBtn.setImage(UIImage(named: "stage4_2_default_Btn"), for: UIControlState.normal)
            }
            else {
                self.firstBtn.setImage(UIImage(named: quizDictionary[shuffledExamples[0].soundName]!), for: UIControlState.normal)
                self.secondBtn.setImage(UIImage(named: quizDictionary[shuffledExamples[1].soundName]!), for: UIControlState.normal)
            }
            self.reduceSize(button: self.firstBtn)
            self.expandSize(button: self.secondBtn)
            self.thirdBtn.setImage(UIImage(named: "stage4_3_deselect_Btn"), for: UIControlState.normal)
            
        } else {
            if isCorrect {
                self.firstBtn.setImage(UIImage(named: "stage4_1_deselect_Btn"), for: UIControlState.normal)
                self.secondBtn.setImage(UIImage(named: "stage4_2_deselect_Btn"), for: UIControlState.normal)
                self.thirdBtn.setImage(UIImage(named: "stage4_3_default_Btn"), for: UIControlState.normal)
            }
            else {
                self.firstBtn.setImage(UIImage(named: quizDictionary[shuffledExamples[0].soundName]!), for: UIControlState.normal)
                self.secondBtn.setImage(UIImage(named: quizDictionary[shuffledExamples[1].soundName]!), for: UIControlState.normal)
                self.thirdBtn.setImage(UIImage(named: quizDictionary[shuffledExamples[2].soundName]!), for: UIControlState.normal)
            }
            self.reduceSize(button: self.secondBtn)
            self.expandSize(button: self.thirdBtn)
        }
    }
    
    
    func changeExampleButtonColorOrange() {
        self.firstBtn.setImage(UIImage(named: "stage4_1_default_Btn"), for: UIControlState.normal)
        self.secondBtn.setImage(UIImage(named: "stage4_2_default_Btn"), for: UIControlState.normal)
        self.thirdBtn.setImage(UIImage(named: "stage4_3_default_Btn"), for: UIControlState.normal)
    }
    
    func disabledExampleButton() {
        firstBtn.isEnabled = false
        secondBtn.isEnabled = false
        thirdBtn.isEnabled = false
    }
    
}
