//
//  Test1Data.swift
//  Dodori
//
//  Created by 이재은 on 2018. 7. 14..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

final class Test1Data: NSObject {
    
    static let shared: Test1Data = Test1Data()
    
    var opportunity: Int = 3
    var reviewPageNum: [Int] = []
    
    let pageNum = ["training_circle1", "training_circle2", "training_circle3",
                   "training_circle4", "training_circle5", "training_circle6",
                   "training_circle7", "training_circle8", "training_circle9",
                   "training_circle10"]

    let yaguEasyFileName = ["yagu_e_1_01", "yagu_e_1_02", "yagu_e_1_03",
                             "yagu_e_1_04", "yagu_e_1_05", "yagu_e_1_06",
                             "yagu_e_1_07", "yagu_e_1_08", "yagu_e_1_09",
                             "yagu_e_1_10"]

    
    let yaguEasyTextArray = ["마음", "우유", "남매", "대답", "쥐",
                             "집", "생각", "공", "햄버거", "당기다"]
    
    let yaguEasyPronunArray = ["[마음]", "[우유]", "[남매]", "[대답]", "[쥐]",
                               "[집]", "[생각]", "[공]", "[햄버거]", "[당기다]"]
    
    

     let yaguHardFileName = ["yagu_h_1_01", "yagu_h_1_02", "yagu_h_1_03",
                              "yagu_h_1_04", "yagu_h_1_05", "yagu_h_1_06",
                              "yagu_h_1_07", "yagu_h_1_08", "yagu_h_1_09",
                              "yagu_h_1_10"]
    
     let yaguHardTextArray = ["좋다", "꿈", "예쁘다", "창", "치즈",
                              "깨끗하다", "뒤쫓다", "지저분하다", "경기", "시작"]
    
     let yaguHardPronunArray = ["[조타]", "[꿈]", "[예쁘다]", "[창]", "[치즈]",
                                "[깨끄타다]", "[뒤쪼따]", "[지저부나다]", "[경기]", "[시작]"]
    
    
    
    
    let tinoEasyFileName = ["tino_e_1_01", "tino_e_1_02", "tino_e_1_03",
                             "tino_e_1_04", "tino_e_1_05", "tino_e_1_06",
                             "tino_e_1_07", "tino_e_1_08", "tino_e_1_09",
                             "tino_e_1_10"]


    let tinoEasyTextArray = ["이름", "엄마", "우리", "가게", "화내다",
                             "세상", "상자", "좋아하다", "보물", "동생"]

    let tinoEasyPronunArray = ["[이름]", "[엄마]", "[우리]", "[가게]", "[화내다]",
                               "[세상]", "[상자]", "[조아하다]", "[보물]", "[동생]"]



    let tinoHardFileName = ["tino_h_1_01", "tino_h_1_02", "tino_h_1_03",
                             "tino_h_1_04", "tino_h_1_05", "tino_h_1_06",
                             "tino_h_1_07", "tino_h_1_08", "tino_h_1_09",
                             "tino_h_1_10"]

    let tinoHardTextArray = ["헤어지다", "분홍색", "들어가다", "웃다", "스티커",
                             "싫다", "친구", "포장", "멋지다", "뛰어가다"]

    let tinoHardPronunArray = ["[헤어지다]", "[부농색]", "[드러가다]", "[우따]", "[스티커]",
                               "[실타]", "[칭구]", "[포장]", "[머찌다]", "[뛰어가다]"]
    
    
    
    let paulEasyFileName = ["paul_e_1_01", "paul_e_1_02", "paul_e_1_03",
                             "paul_e_1_04", "paul_e_1_05", "paul_e_1_06",
                             "paul_e_1_07", "paul_e_1_08","paul_e_1_09",
                             "paul_e_1_10"]


    let paulEasyTextArray = ["안녕", "매일", "얼음", "지구", "바다",
                             "기적", "미소", "행복", "세상", "저녁"]

    let paulEasyPronunArray = ["[안녕]", "[매일]", "[어름]", "[지구]", "[바다]",
                               "[기적]", "[미소]", "[행복]", "[세상]", "[저녁]"]



    let paulHardFileName = ["paul_h_1_01","paul_h_1_02","paul_h_1_03",
                             "paul_h_1_04","paul_h_1_05","paul_h_1_06",
                             "paul_h_1_07","paul_h_1_08","paul_h_1_09",
                             "paul_h_1_10"]

    let paulHardTextArray = ["조심하다", "준비", "시간", "따뜻하다", "춥다",
                             "기쁘다", "아프다", "썰매", "쓰레기", "펭귄"]

    let paulHardPronunArray = ["[조시마다]", "[준비]", "[시간]", "[따뜨타다]", "[춥따]",
                                "[기쁘다]", "[아프다]", "[썰매]", "[쓰레기]", "[펭귄]"]

}
