//
//  QuizViewController.swift
//  Dodori
//
//  Created by SWUCOMPUTER on 2018. 6. 13..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import AVFoundation
import Lottie

// 퀴즈 화면
final class QuizViewController: UIViewController, AVAudioPlayerDelegate {
    
    // MARK: IBOutlets
    @IBOutlet var replayButton: UIButton!
    @IBOutlet weak var quizImageView: UIImageView!
    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!
    @IBOutlet weak var pageNumImageView: UIImageView!
    @IBOutlet weak var dodoriSpeakingImageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK:- Properties
    var quizs: [Quiz] = []

    var audioPlayer: AVAudioPlayer!
    var audioPlayer2: AVAudioPlayer!
    var playFileNumber = 0
    
    var isBigSize: Bool = false
    
    var pageNumber: Int = 0
    var testData: String = ""
    var soundName: String = ""
    var effectSoundName: String = ""
    var selectedAnswer: Int?
    var quizSoundName: [Example]?
    
    var soundNameInQuiz: [String] = [""]
    var imageNameInQuiz: String = ""
    var textInQuiz: String = ""
    var correctAnswerIndex: Int = 0
    var userSelectedIndex: Int = 0
    var opportunity: Int = 1
    var isBubble: Bool = false
    var isCorrect: Bool = true
    var isSolve: Bool = false
    
    var timer = Timer()
    let delay = 0.5
    
    public var animationView = LOTAnimationView()
    public var animationView2 = LOTAnimationView()
    
    var quizDictionary:[String:String] = [:]
    var shuffledExamples:[Example] = []

/// 퀴즈 인트로 화면
    func intro() {
        guard let storyboardId = self.restorationIdentifier else { return }
        
        guard let vc =
            storyboard?.instantiateViewController(withIdentifier: "IntroView") as? IntroViewController else { return }
        
        vc.testIntroDelegate = self
        vc.storyBoardId = storyboardId
        vc.soundName = PopUpData.shared.changeIntroSound(storyBoardId: storyboardId)
        vc.speakingImageName = ViewData.shared.changeImage(storyBoardId: storyboardId)
        vc.view.backgroundColor = UIColor(white: 0, alpha: 0.75)
        vc.modalPresentationStyle = .overCurrentContext
        
        self.present(vc, animated: false, completion: nil)
    }
    
    // MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        intro()

        receiveData()
        setQuizData()
    }
    
    var audioSession: AVAudioSession?
    
    override func viewDidAppear(_ animated: Bool) {

    }
  
  /// 메인 화면으로 이동
    @IBAction func goHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: false)
        ViewData.shared.selectedReview = nil
    }
  
  /// 어떤 동화, 난이도인지 알려줌
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
  
  /// 퀴즈 디폴트 상태 설정
    func defaultData() {
        playFileNumber = 0
        opportunity = 1
        isBubble = false
        isSolve = false
        isCorrect = true
        nextButton.isHidden = true
        enabledExampleButton()
    }
  
    func enabledExampleButton() {
        firstBtn.isEnabled = true
        secondBtn.isEnabled = true
        thirdBtn.isEnabled = true
    }
  
  /// 어떤 데이터인지
    func sendData() {

        let pageNumImg: String = ViewData.shared.pageNum[pageNumber]
        pageNumImageView.image = UIImage(named: pageNumImg)
        quizDictionary.removeAll()

        if testData == "tinoEasy" {
            soundNameInQuiz = tinoEasyQuizSound[pageNumber]
            imageNameInQuiz = tinoEasyQuizImageName[pageNumber]
            textInQuiz = tinoEasyTextArray[pageNumber]
            for i in 0..<tinoEasyQuizSound[pageNumber].count {
                quizDictionary[tinoEasyQuizSound[pageNumber][i]] = tinoEasyQuizAnswer[pageNumber][i]
            }
        }
        else if testData == "tinoHard" {
            soundNameInQuiz = tinoHardQuizSound[pageNumber]
            imageNameInQuiz = tinoHardQuizImageName[pageNumber]
            textInQuiz = tinoHardTextArray[pageNumber]
            for i in 0..<tinoHardQuizSound[pageNumber].count {
                quizDictionary[tinoHardQuizSound[pageNumber][i]] = tinoHardQuizAnswer[pageNumber][i]
            }
        }
        if testData == "yaguEasy" {
            soundNameInQuiz = yaguEasyQuizSound[pageNumber]
            imageNameInQuiz = yaguEasyQuizImageName[pageNumber]
            textInQuiz = yaguEasyTextArray[pageNumber]
            for i in 0..<yaguEasyQuizSound[pageNumber].count {
                quizDictionary[yaguEasyQuizSound[pageNumber][i]] = yaguEasyQuizAnswer[pageNumber][i]
            }
        }
        else if testData == "yaguHard" {
            soundNameInQuiz = yaguHardQuizSound[pageNumber]
            imageNameInQuiz = yaguHardQuizImageName[pageNumber]
            textInQuiz = yaguHardTextArray[pageNumber]
            for i in 0..<yaguHardQuizSound[pageNumber].count {
                quizDictionary[yaguHardQuizSound[pageNumber][i]] = yaguHardQuizAnswer[pageNumber][i]
            }
        }
        else if testData == "paulEasy" {
            soundNameInQuiz = paulEasyQuizSound[pageNumber]
            imageNameInQuiz = paulEasyQuizImageName[pageNumber]
            textInQuiz = paulEasyTextArray[pageNumber]
            for i in 0..<paulEasyQuizSound[pageNumber].count {
                quizDictionary[paulEasyQuizSound[pageNumber][i]] = paulEasyQuizAnswer[pageNumber][i]
            }
        }
        else if testData == "paulHard" {
            soundNameInQuiz = paulHardQuizSound[pageNumber]
            imageNameInQuiz = paulHardQuizImageName[pageNumber]
            textInQuiz = paulHardTextArray[pageNumber]
            for i in 0..<paulHardQuizSound[pageNumber].count {
                quizDictionary[paulHardQuizSound[pageNumber][i]] = paulHardQuizAnswer[pageNumber][i]
            }
        }
    }
  
  /// 퀴즈 데이터 설정
    func setQuizData() {
        sendData()
        shuffledExamples.removeAll()
        
        var examples = [Example]()
            for j in 0..<3 {
                let soundName = soundNameInQuiz[j]
                let example = Example(soundName: soundName)
                examples.append(example)
            }
        let answerExample = examples[0]
        shuffledExamples = examples.shuffled()
        let answerIndex = shuffledExamples.firstIndex { $0.soundName == answerExample.soundName }
        if let index = answerIndex {
            let quiz = Quiz(imageName: imageNameInQuiz, text: textInQuiz, examples: shuffledExamples, correctAnswerIndex: index)
            stage.append(quiz)
        }
        
        for quiz in stage {
            correctAnswerIndex = quiz.correctAnswerIndex
            quizSoundName = quiz.examples
            soundName = quizSoundName![0].soundName
            quizImageView.image = UIImage(named: quiz.imageName)
            quizLabel.text = quiz.text
        }

    }
  
  /// 정답인지 확인
    func confirmAnswer() {
        if userSelectedIndex == correctAnswerIndex {
            print("정답")
            isCorrect = true
            correctLottie()
        } else {
            print("오답")
            opportunity -= 1
            isCorrect = false
            incorrectPopUp()
        }
    }
  
  /// 도돌이 말풍선 소리 재생
    func playBubbleSound() {
        effectSoundName = "dodori_quiz"
        effectSoundPlayer()
        self.audioPlayer2?.play()
    }
  
  /// 맞았을 때 로티
    func correctLottie() {
        let randomNo: UInt32 = arc4random_uniform(5) + 1;
        let correctIconImageName = "correct_icon\(randomNo)"
        effectSoundName = "dodori_stamp\(randomNo)"
        effectSoundPlayer()
        self.audioPlayer2?.play()
        animationView = LOTAnimationView(name: correctIconImageName)
        animationView.frame = CGRect(x: 0, y: 0, width: 1024, height: 768)
        self.view.addSubview(animationView)
        if pageNumber == 2 {
            animationView.play(completion: {(true) in
                self.nextPage()})
        } else {
            animationView.play(completion: {(true) in
                self.changeExampleButtonColorOrange();
                self.disabledExampleButton();
                self.animationView.removeFromSuperview();
                self.nextButton.isHidden = false
            })
        }
    }

/// 틀렸을 때 팝업
    func incorrectPopUp() {
        guard let storyboardId = self.restorationIdentifier else { return }
        
        guard let vc =
            storyboard?.instantiateViewController(withIdentifier: "IncorrectPopUpView") as? IncorrectPopUpViewController else { return }
        
        vc.storyboardID = storyboardId
        vc.delegate = self
        vc.imageName = PopUpData.shared.changeIncorrectImage(storyBoardId: storyboardId)
        vc.soundName = "dodori_quiz_wrong"
        vc.view.backgroundColor = UIColor(white: 0, alpha: 0.75)
        vc.modalPresentationStyle = .overCurrentContext
        
        self.present(vc, animated: false, completion: nil)
    }

}

extension QuizViewController: IncorrectPopUpDelegate {
    
    @IBAction func nextPage() {
        if isSolve == true {
            ResultData.shared.totalOpportunityScore += 1
            ResultData.shared.solvedOpportunityScore += opportunity
        }
        print("r\(ResultData.shared.totalOpportunityScore)")
        print("s\(ResultData.shared.solvedOpportunityScore)")
        pageNumber += 1;
        self.audioPlayer?.pause()
        self.audioPlayer2.pause()
        self.defaultData()
        animationView.removeFromSuperview()
        animationView2.removeFromSuperview()
        if pageNumber == 3 {
            // 화면 전환할 뷰 컨트롤러를 Storyboard ID 정보를 이용, 읽어와서 객체로 생성함
            if let view = self.storyboard?.instantiateViewController(withIdentifier: "ResultView") {
                // 화면을 전환함
                self.navigationController?.pushViewController(view, animated: false)
            }
        }
        else {
            setQuizData()
            defaultButton()
            initializePlayer()
            self.audioPlayer?.play()
        }
    }
    
    func playAuto() {
        animationView.removeFromSuperview()
        defaultButton()
        playFileNumber = 0
        soundName = (quizSoundName?[playFileNumber].soundName)!
        initializePlayer()
        self.audioPlayer?.play()
    }
}

extension QuizViewController: TestIntroDelegate {
    
    func bubbleDefaultLottie() {
        playBubbleSound()
        animationView = LOTAnimationView(name: "bubble_stage4_1")
        animationView.frame = CGRect(x: 175, y: 50, width: 277, height: 60)
        self.view.addSubview(animationView)
        animationView.play(completion: {(true) in
            self.dodoriSpeakingImageView.isHidden = false
        })
    }
}
