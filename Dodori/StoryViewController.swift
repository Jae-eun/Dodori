//
//  StoryViewController.swift
//  Dodori
//
//  Created by SWUCOMPUTER on 2018. 6. 13..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import AVFoundation

class StoryViewController: UIViewController , AVAudioPlayerDelegate {
    
    // MARK:- Properties
    var player: AVAudioPlayer!
    
    @IBOutlet weak var storyImage: UIImageView!
    let Data3 = StoryData()
    var pageNumber: Int = 0
    var testData: String = ""
    
    // MARK: IBOutlets
  //  @IBOutlet var playPauseButton: UIButton!
    
    
    // 메인화면으로 이동
    @IBAction func goHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: false)
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
//        if testData == "tino" {
//
//            let storyImg: String = StoryData.tinoStory[pageNumber]
//            storyImage.image = UIImage(named: storyImg)
//        }
       // else if testData == "yagu" {
     if testData == "yagu" {
                 let storyImg: String = storyData.yaguStory[pageNumber]
                storyImage.image = UIImage(named: storyImg)
        }
//        else if testData == "paul" {
//
//                 let storyImg: String = StoryData.paulStory[pageNumber]
//                storyImage.image = UIImage(named: storyImg)
//        }
    }
    
    // MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        receiveData()
        sendData()
        // Do any additional setup after loading the view, typically from a nib.
        self.initializePlayer()
        self.player?.play()
    }
    
    
    // MARK: - Methods
    // MARK: - Custom Method
    func initializePlayer() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "Yagustory1") else {
            print("음원 파일 에셋을 가져올 수 없습니다")
            return
        }
        
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
    }
    
    /*
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            self.player?.play()
        } else {
            self.player?.pause()
        }
        
    }
    */
    
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
    
//    func audioPlayerDidFinishPlaying(_ Player: AVAudioPlayer, successgully flag: Bool) {
//        self.playPauseButton.isSelected = false
 //   }

}
