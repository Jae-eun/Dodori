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


class IntroViewController: UIViewController {

    @IBOutlet weak var introLabel: UILabel!
    var soundName: String = ""
    var storyBoardId: String = ""
    var labelText: String?
    
    @IBAction func startBtn(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        pressedBtn()
    }
    
    @IBAction func passedStoryBtn(_ sender: Any) {
        
        if let view = self.storyboard?.instantiateViewController(withIdentifier: "LevelView") {
            // 화면을 전환합니다.
            self.dismiss(animated: false, completion: nil)
//            self.navigationController?.popViewController(animated: false)
            self.navigationController?.pushViewController(view, animated: false)
            
        }
    }
    //    public func changeText() {
//
//        guard let storyBoardId = ViewData.shared.introID else { return }
//
//        switch storyBoardId {
//            case "Test1View":
//                introLabel?.text = "3번의 단어 연습 기회가 있고,\n단어를 정확히 얘기하면\n다음으로 넘어갈 수 있어!"
//            case "Test2View":
//                introLabel?.text = "3번의 문장 연습 기회가 있고,\n문장을 정확히 얘기하면\n다음으로 넘어갈 수 있어!"
//            case "StoryView":
//                introLabel?.text = "동화를 듣고 읽는 시간이야.\n흔들리는 그림을 누르면\n재미있는 소리가 나와!"
//            default:
//                introLabel?.text = "단어와 그림을 보고\n알맞은 소리를 찾는 퀴즈야!\n소리를 듣고 정답을 찾아보자!"
//        }
//    }
    
    func dodoriLottie() {
        let animationView = LOTAnimationView(name: "dodori_anim_test6")
        animationView.frame = CGRect(x: 166, y: 200, width: 334, height: 506)
        self.view.addSubview(animationView)
        animationView.play()
        //        animationView.pause()
        //        animationView.willRemoveSubview(animationView)
        //                        nextPage()
        
    }
    
//    func setLabel() {
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineSpacing = withLineSpacing
//        let attrString = NSMutableAttributedString(string: text)
//        attrString.addAttribute(NSAttributedStringKey.paragraphStyle,
//                                value:paragraphStyle,
//                                range:NSMakeRange(0, attrString.length))
//        introLabel.attributedText = attrString
//        introLabel.textAlignment = alignment
//    }
    
    // 메인화면으로 이동
    @IBAction func goHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introLabel?.text = labelText

        dodoriLottie()
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
