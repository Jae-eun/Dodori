//
//  QuizData.swift
//  Dodori
//
//  Created by 이재은 on 2018. 7. 29..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

struct Example: CustomStringConvertible {
    let soundName: String
    var description: String {
        return "\(soundName)"
    }
}


var stage = [Quiz]()

let yaguEasyQuizSound = [["quiz_yagu_E_1_1", "quiz_yagu_E_1_2", "quiz_yagu_E_1_3"],
                         ["quiz_yagu_E_2_1", "quiz_yagu_E_2_2", "quiz_yagu_E_2_3"],
                         ["quiz_yagu_E_3_1", "quiz_yagu_E_3_2", "quiz_yagu_E_3_3"]]


let yaguHardQuizSound = [["quiz_yagu_H_1_1", "quiz_yagu_H_1_2", "quiz_yagu_H_1_3"],
                        ["quiz_yagu_H_2_1", "quiz_yagu_H_2_2", "quiz_yagu_H_2_3"],
                        ["quiz_yagu_H_2_1", "quiz_yagu_H_2_2", "quiz_yagu_H_2_3"]]

let yaguEasyQuizImageName = ["yagu_E_4_01","yagu_E_4_02","yagu_E_4_03"]
let yaguEasyTextArray = ["자랑", "날다", "구르다"]

for i in 0..<3 {
    let soundNameInQuiz = yaguEasyQuizSound[i]
    let imageNameInQuiz = yaguEasyQuizImageName[i]
    let textInQuiz = yaguEasyTextArray[i]
    var examples = [Example]()
    for j in 0..<3 {
        let soundName = soundNameInQuiz[j]
        let example = Example(soundName: soundName)
        examples.append(example)
    }
    let answerExample = examples[0]
    let shuffledExamples = examples.shuffled()
    let answerIndex = shuffledExamples.firstIndex { $0.soundName == answerExample.soundName }
    if let index = answerIndex {
        let quiz = Quiz(imageName: imageNameInQuiz, text: textInQuiz, examples: shuffledExamples, correctAnswerIndex: index)
        stage.append(quiz)
    }
}

for quiz in stage {
    let correctAnswerIndex = quiz.correctAnswerIndex
    let examples = quiz.examples
    let imageName = quiz.imageName
    let text = quiz.text
    let userSelectedIndex = 1
    if userSelectedIndex == correctAnswerIndex {
        print("정답")
    } else {
        print("오답")
    }
}
//class QuizData: NSObject {
//
//    static let shared: QuizData = QuizData()
//
//    let pageNum = ["training_stage4_circle1", "training_stage4_circle2", "training_stage4_circle3"]
//
//    var playFileNumber = 0
//
//    let yaguEasyQuizImageName = ["yagu_E_4_01","yagu_E_4_02","yagu_E_4_03"]
//    let yaguEasyTextArray = ["자랑", "날다", "구르다"]
//    let yaguEasyArrayList = [["자랑", "사랑", "파랑"], ["날다", "알다", "말다"],
//                             ["구르다", "두르다", "부르다"]]
//
//    let yaguHardQuizImageName = ["yagu_H_4_01","yagu_H_4_02","yagu_H_4_03"]
//    let yaguHardTextArray = ["쥐", "투수", "찢다"]
//    let yaguHardArrayList = [["쥐", "귀", "위"], ["투수", "우수", "추수"],
//                             ["찢다", "찍다", "씻다"]]
//
////    let yaguEasyQuizSound: [[Double: String]] = [[1.1:"yagu_E_4_1_1", 1.2:"yagu_E_4_1_2", 1.3:"yagu_E_4_1_3"], [2.1:"yagu_E_4_2_1", 2.2:"yagu_E_4_2_2", 2.3:"yagu_E_4_2_3"], [3.1:"yagu_E_4_3_1", 3.2:"yagu_E_4_3_2", 3.3:"yagu_E_4_3_3"]]
////
////    let yaguHardQuizSound: [[Double: String]] = [[1.1:"yagu_H_4_1_1", 1.2:"yagu_H_4_1_2", 1.3:"yagu_H_4_1_3"], [2.1:"yagu_H_4_2_1", 2.2:"yagu_H_4_2_2", 2.3:"yagu_H_4_2_3"], [3.1:"yagu_H_4_3_1", 3.2:"yagu_H_4_3_2", 3.3:"yagu_H_4_3_3"]]
//
////    var yaguEasyQuizSound = [String](repeating: "A", count: 3)
//
//
//    let yaguEasyQuizSound = [["quiz_yagu_E_1_1", "quiz_yagu_E_1_2", "quiz_yagu_E_1_3"],
//                             ["quiz_yagu_E_2_1", "quiz_yagu_E_2_2", "quiz_yagu_E_2_3"],
//                             ["quiz_yagu_E_3_1", "quiz_yagu_E_3_2", "quiz_yagu_E_3_3"]]
//
//
//    let yaguHardQuizSound = [["quiz_yagu_H_1_1", "quiz_yagu_H_1_2", "quiz_yagu_H_1_3"],
//                            ["quiz_yagu_H_2_1", "quiz_yagu_H_2_2", "quiz_yagu_H_2_3"],
//                            ["quiz_yagu_H_2_1", "quiz_yagu_H_2_2", "quiz_yagu_H_2_3"]]
//
//    let tinoEasyQuizSound = [["quiz_tino_E_1_1", "quiz_tino_E_1_2", "quiz_tino_E_1_3"],
//                             ["quiz_tino_E_2_1", "quiz_tino_E_2_2", "quiz_tino_E_2_3"],
//                             ["quiz_tino_E_3_1", "quiz_tino_E_3_2", "quiz_tino_E_3_3"]]
//
//
//    let tinoHardQuizSound = [["quiz_tino_H_1_1", "quiz_tino_H_1_2", "quiz_tino_H_1_3"],
//                             ["quiz_tino_H_2_1", "quiz_tino_H_2_2", "quiz_tino_H_2_3"],
//                             ["quiz_tino_H_2_1", "quiz_tino_H_2_2", "quiz_tino_H_2_3"]]
//
//    let paulEasyQuizSound = [["quiz_paul_E_1_1", "quiz_paul_E_1_2", "quiz_paul_E_1_3"],
//                             ["quiz_paul_E_2_1", "quiz_paul_E_2_2", "quiz_paul_E_2_3"],
//                             ["quiz_paul_E_3_1", "quiz_paul_E_3_2", "quiz_paul_E_3_3"]]
//
//
//    let paulHardQuizSound = [["quiz_paul_H_1_1", "quiz_paul_H_1_2", "quiz_paul_H_1_3"],
//                             ["quiz_paul_H_2_1", "quiz_paul_H_2_2", "quiz_paul_H_2_3"],
//                             ["quiz_paul_H_2_1", "quiz_paul_H_2_2", "quiz_paul_H_2_3"]]
//
//    let yaguEasyQuizSound1 = ["quiz_yagu_E_1_1", "quiz_yagu_E_1_2", "quiz_yagu_E_1_3"]
//    let yaguEasyQuizSound2 = ["quiz_yagu_E_2_1", "quiz_yagu_E_2_2", "quiz_yagu_E_2_3"]
//    let yaguEasyQuizSound3 = ["quiz_yagu_E_3_1", "quiz_yagu_E_3_2", "quiz_yagu_E_3_3"]
//
//
//    let yaguHardQuizSound1 = ["yagu_H_4_1_1", "yagu_H_4_1_2", "yagu_H_4_1_3"]
//    let yaguHardQuizSound2 = ["yagu_H_4_2_1", "yagu_H_4_2_2", "yagu_H_4_2_3"]
//    let yaguHardQuizSound3 = ["yagu_H_4_3_1", "yagu_H_4_3_2", "yagu_H_4_3_3"]
//
//
//
//    let tinoEasyQuizImageName = ["tino_E_4_01","tino_E_4_02","tino_E_4_03"]
//    let tinoEasyTextArray = ["반", "웃다", "포장"]
//    let tinoEasyArrayList = [["반", "판", "잔"], ["웃다", "묻다", "붓다"],
//                             ["포장", "보장", "고장"]]
//
//    let tinoHardQuizImageName = ["tino_H_4_01","tino_H_4_02","tino_H_4_03"]
//    let tinoHardTextArray = ["주다", "받다", "우리"]
//    let tinoHardArrayList = [["주다", "두다", "추다"], ["받다", "같다", "맞다"],
//                             ["우리", "무리", "부리"]]
//
////    let tinoEasyQuizSound: [[Double: String]] = [[1.1:"tino_E_4_1_1", 1.2:"tino_E_4_1_2", 1.3:"tino_E_4_1_3"], [2.1:"tino_E_4_2_1", 2.2:"tino_E_4_2_2", 2.3:"tino_E_4_2_3"], [3.1:"tino_E_4_3_1", 3.2:"tino_E_4_3_2", 3.3:"tino_E_4_3_3"]]
////
////    let tinoHardQuizSound: [[Double: String]] = [[1.1:"tino_H_4_1_1", 1.2:"tino_H_4_1_2", 1.3:"tino_H_4_1_3"], [2.1:"tino_H_4_2_1", 2.2:"tino_H_4_2_2", 2.3:"tino_H_4_2_3"], [3.1:"tino_H_4_3_1", 3.2:"tino_H_4_3_2", 3.3:"tino_H_4_3_3"]]
//
//
//    let paulEasyQuizImageName = ["paul_E_4_01","paul_E_4_02","paul_E_4_03"]
//    let paulEasyTextArray = ["조금", "작다", "달리다"]
//    let paulEasyArrayList = [["조금", "소금", "모금"], ["작다", "박다", "막다"],
//                             ["달리다", "살리다", "알리다"]]
//
//    let paulHardQuizImageName = ["paul_H_4_01","paul_H_4_02","paul_H_4_03"]
//    let paulHardTextArray = ["봉지", "돕다", "잃다"]
//    let paulHardArrayList = [["봉지", "공지", "동지"], ["돕다", "곱다", "좁다"],
//                             ["잃다", "싫다", "읽다"]]
//
//
//    let paulEasyQuizSound1 = ["paul_E_4_1_1", "paul_E_4_1_2", "paul_E_4_1_3"]
//    let paulEasyQuizSound2 = ["paul_E_4_2_1", "paul_E_4_2_2", "paul_E_4_2_3"]
//    let paulEasyQuizSound3 = ["paul_E_4_3_1", "paul_E_4_3_2", "paul_E_4_3_3"]
//
//    let paulHardQuizSound1 = ["paul_H_4_1_1", "paul_H_4_1_2", "paul_H_4_1_3"]
//    let paulHardQuizSound2 = ["paul_H_4_2_1", "paul_H_4_2_2", "paul_H_4_2_3"]
//    let paulHardQuizSound3 = ["paul_H_4_3_1", "paul_H_4_3_2", "paul_H_4_3_3"]
//
//
////    let paulEasyQuizSound: [[Double: String]] = [[1.1:"paul_E_4_1_1", 1.2:"paul_E_4_1_2", 1.3:"paul_E_4_1_3"], [2.1:"paul_E_4_2_1", 2.2:"paul_E_4_2_2", 2.3:"paul_E_4_2_3"], [3.1:"paul_E_4_3_1", 3.2:"paul_E_4_3_2", 3.3:"paul_E_4_3_3"]]
////
////    let paulHardQuizSound: [[Double: String]] = [[1.1:"paul_H_4_1_1", 1.2:"paul_H_4_1_2", 1.3:"paul_H_4_1_3"], [2.1:"paul_H_4_2_1", 2.2:"paul_H_4_2_2", 2.3:"paul_H_4_2_3"], [3.1:"paul_H_4_3_1", 3.2:"paul_H_4_3_2", 3.3:"paul_H_4_3_3"]]
//
//}
