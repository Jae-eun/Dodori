//
//  IncorrectPopUpViewController.swift
//  Dodori
//
//  Created by 이재은 on 13/10/2018.
//  Copyright © 2018 SWUCOMPUTER. All rights reserved.
//

import UIKit
import AVFoundation


protocol IncorrectPopUpDelegate: class {
    func nextPage()
    func playAuto()
}

final class IncorrectPopUpViewController: UIViewController, AVAudioPlayerDelegate {

     weak var delegate: IncorrectPopUpDelegate?
    
    @IBOutlet weak var incorrectPopUpImageView: UIImageView!
    @IBOutlet weak var repeatPopUpImageView: UIImageView!
    
    var soundName: String = ""
    var audioPlayer3: AVAudioPlayer!
    var storyboardID: String = ""

    var imageName: String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setPopUpImage()
        
        initializePlayer()
        self.audioPlayer3?.play()
//        incorrectPopUpImageView.image = UIImage(named: imageName)

    }

    func setPopUpImage() {
        print(storyboardID)
        if storyboardID == "QuizView" {
            incorrectPopUpImageView.isHidden = true
        } else {
            repeatPopUpImageView.isHidden = true
        }
    }
    
    // MARK: - Methods
    // MARK: - Custom Method
    func initializePlayer() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: soundName) else {
            print("음원 파일 에셋을 가져올 수 없습니다")
            return
        }
        
        do {
            try self.audioPlayer3 = AVAudioPlayer(data: soundAsset.data)
            self.audioPlayer3.delegate = self

        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
    }
    
    func audioPlayerDidFinishPlaying(_ Player: AVAudioPlayer, successfully flag: Bool) {
        if flag == true {
            if storyboardID == "QuizView" {
                delegate?.playAuto()
            }
            else {
                delegate?.nextPage()
            }
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    
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
    

}
