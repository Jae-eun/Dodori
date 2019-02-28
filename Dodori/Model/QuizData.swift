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

struct Quiz: CustomStringConvertible {
    let imageName: String
    let text: String
    let examples: [Example]
    let correctAnswerIndex: Int
    var description: String {
        return "문제(보기: \(examples), 이미지: \(imageName), 텍스트: \(text), 정답인덱스: \(correctAnswerIndex))"
    }
}

//struct AnswerImage: CustomStringConvertible {
//    let exampleTextImageName: String
//    var description: String {
//        return "\(exampleTextImageName)"
//    }
//}

//struct Quiz: CustomStringConvertible {
//    let imageName: String
//    let text: String
//    let examples: [Example]
//    let answerImages: [AnswerImage]
//    let correctAnswerIndex: Int
//    var description: String {
//        return "문제(보기: \(examples), 문항이미지: \(answerImages), 이미지: \(imageName), 텍스트: \(text), 정답인덱스: \(correctAnswerIndex))"
//    }
//}



var stage = [Quiz]()


let yaguEasyQuizSound = [["quiz_yagu_E_1_1", "quiz_yagu_E_1_2", "quiz_yagu_E_1_3"],
                         ["quiz_yagu_E_2_1", "quiz_yagu_E_2_2", "quiz_yagu_E_2_3"],
                         ["quiz_yagu_E_3_1", "quiz_yagu_E_3_2", "quiz_yagu_E_3_3"]]

let yaguEasyQuizImageName = ["yagu_e_4_01","yagu_e_4_02","yagu_e_4_03"]
let yaguEasyTextArray = ["자랑", "날다", "구르다"]

let yaguEasyQuizAnswer = [["stage4_e_yagu_1", "stage4_e_yagu_2", "stage4_e_yagu_3"],
                          ["stage4_e_yagu_4", "stage4_e_yagu_5", "stage4_e_yagu_6"],
                          ["stage4_e_yagu_7", "stage4_e_yagu_8", "stage4_e_yagu_9"]]

let yaguHardQuizSound = [["quiz_yagu_H_1_1", "quiz_yagu_H_1_2", "quiz_yagu_H_1_3"],
                        ["quiz_yagu_H_2_1", "quiz_yagu_H_2_2", "quiz_yagu_H_2_3"],
                        ["quiz_yagu_H_3_1", "quiz_yagu_H_3_2", "quiz_yagu_H_3_3"]]

let yaguHardQuizImageName = ["yagu_h_4_01","yagu_h_4_02","yagu_h_4_03"]
let yaguHardTextArray = ["쥐", "투수", "찢다"]

let yaguHardQuizAnswer = [["stage4_h_yagu_1", "stage4_h_yagu_2", "stage4_h_yagu_3"],
                          ["stage4_h_yagu_4", "stage4_h_yagu_5", "stage4_h_yagu_6"],
                          ["stage4_h_yagu_7", "stage4_h_yagu_8", "stage4_h_yagu_9"]]



let tinoEasyQuizSound = [["quiz_tino_E_1_1", "quiz_tino_E_1_2", "quiz_tino_E_1_3"],
                         ["quiz_tino_E_2_1", "quiz_tino_E_2_2", "quiz_tino_E_2_3"],
                         ["quiz_tino_E_3_1", "quiz_tino_E_3_2", "quiz_tino_E_3_3"]]

let tinoEasyQuizImageName = ["tino_e_4_01","tino_e_4_02","tino_e_4_03"]
let tinoEasyTextArray = ["반", "웃다", "포장"]

let tinoEasyQuizAnswer = [["stage4_e_tino_1", "stage4_e_tino_2", "stage4_e_tino_3"],
                          ["stage4_e_tino_4", "stage4_e_tino_5", "stage4_e_tino_6"],
                          ["stage4_e_tino_7", "stage4_e_tino_8", "stage4_e_tino_9"]]

let tinoHardQuizSound = [["quiz_tino_H_1_1", "quiz_tino_H_1_2", "quiz_tino_H_1_3"],
                         ["quiz_tino_H_2_1", "quiz_tino_H_2_2", "quiz_tino_H_2_3"],
                         ["quiz_tino_H_3_1", "quiz_tino_H_3_2", "quiz_tino_H_3_3"]]

let tinoHardQuizImageName = ["tino_h_4_01","tino_h_4_02","tino_h_4_03"]
let tinoHardTextArray = ["주다", "받다", "우리"]

let tinoHardQuizAnswer = [["stage4_h_tino_1", "stage4_h_tino_2", "stage4_h_tino_3"],
                          ["stage4_h_tino_4", "stage4_h_tino_5", "stage4_h_tino_6"],
                          ["stage4_h_tino_7", "stage4_h_tino_8", "stage4_h_tino_9"]]


let paulEasyQuizSound = [["quiz_paul_E_1_1", "quiz_paul_E_1_2", "quiz_paul_E_1_3"],
                         ["quiz_paul_E_2_1", "quiz_paul_E_2_2", "quiz_paul_E_2_3"],
                         ["quiz_paul_E_3_1", "quiz_paul_E_3_2", "quiz_paul_E_3_3"]]

let paulEasyQuizImageName = ["paul_e_4_01","paul_e_4_02","paul_e_4_03"]
let paulEasyTextArray = ["조금", "작다", "달리다"]

let paulEasyQuizAnswer = [["stage4_e_paul_1", "stage4_e_paul_2", "stage4_e_paul_3"],
                          ["stage4_e_paul_4", "stage4_e_paul_5", "stage4_e_paul_6"],
                          ["stage4_e_paul_7", "stage4_e_paul_8", "stage4_e_paul_9"]]


let paulHardQuizSound = [["quiz_paul_H_1_1", "quiz_paul_H_1_2", "quiz_paul_H_1_3"],
                         ["quiz_paul_H_2_1", "quiz_paul_H_2_2", "quiz_paul_H_2_3"],
                         ["quiz_paul_H_3_1", "quiz_paul_H_3_2", "quiz_paul_H_3_3"]]

let paulHardQuizImageName = ["paul_h_4_01","paul_h_4_02","paul_h_4_03"]
let paulHardTextArray = ["봉지", "돕다", "잃다"]

let paulHardQuizAnswer = [["stage4_h_paul_1", "stage4_h_paul_2", "stage4_h_paul_3"],
                          ["stage4_h_paul_4", "stage4_h_paul_5", "stage4_h_paul_6"],
                          ["stage4_h_paul_7", "stage4_h_paul_8", "stage4_h_paul_9"]]
