//
//  QuizSoundViewController.swift
//  Dodori
//
//  Created by 이재은 on 14/10/2018.
//  Copyright © 2018 SWUCOMPUTER. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

extension QuizViewController {
    
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        playFileNumber = 0
        soundName = (quizSoundName?[playFileNumber].soundName)!
        print(playFileNumber)
        if sender.isSelected {
            self.initializePlayer()
            self.audioPlayer?.play()
        } else {
//            self.audioPlayer?.pause()
        }
    }
    
    // MARK: - Methods
    // MARK: - Custom Method
    func initializePlayer() {
        print("qq\(quizSoundName)")
        guard let soundAsset: NSDataAsset = NSDataAsset(name: soundName) else {
            print("음원 파일 에셋을 가져올 수 없습니다")
            return
        }
        
        do {
            try self.audioPlayer = AVAudioPlayer(data: soundAsset.data)
            self.audioPlayer.delegate = self
            changeExampleButtonPlay()
            playFileNumber += 1
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
            self.audioPlayer2.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
    }
    
//    func playerDidFinishPlaying(note: NSNotification) {
//        print("Audio Finished")
//    }
    
    
    // MARK: AVAudioPlayerDelegate
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        guard let error: Error = error else {
            print("오디오 플레이어 디코드 오류발생")
            return
        }
        
        let message: String
        message = "오디오 플레이어 오류 발생 \(error.localizedDescription)"
        
        let alert: UIAlertController = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default) { (action: UIAlertAction) -> Void in
            
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func audioPlayerDidFinishPlaying(_ Player: AVAudioPlayer, successfully flag: Bool) {
        self.replayButton.isSelected = false
        defaultButton()
//        if isCorrect == true {
//            playFileNumber = 0
//            isCorrect = false
//        }
        
//        if playFileNumber == 2 {
//            isBubble = false
//        }
        

        if playFileNumber < 3  {
            // 다시 재생
            soundName = (quizSoundName?[playFileNumber].soundName)!
            initializePlayer()
            self.audioPlayer?.play()
        } else {
            // 끝나고
//            changeExampleButtonColoOrange()
            self.audioPlayer?.pause()
            // 기회 끝
            if opportunity == 0 {
                if pageNumber == 2 {
                    nextPage()
                } else {
                    disabledExampleButton()
                    nextButton.isHidden = false
                }
            }
        }
        
//        if isBubble == true && playFileNumber == 3 {
//            playFileNumber = 0
//            soundName = (quizSoundName?[playFileNumber].soundName)!
//            initializePlayer()
//            self.audioPlayer?.play()
//        }
    }
}
