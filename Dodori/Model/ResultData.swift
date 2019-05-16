//
//  ResultData.swift
//  Dodori
//
//  Created by 이재은 on 2018. 8. 20..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import Foundation

final class ResultData: NSObject {
    static let shared: ResultData = ResultData()
    
    var totalOpportunityScore: Int = 1
    var solvedOpportunityScore: Int = 1
    
    let backgroundImage = ["result_BG_tino", "result_BG_yagu", "result_BG_paul"]
    
    let endBtnImage = ["resultTinoFinishBtn", "resultYaguFinishBtn", "resultPaulFinishBtn"]
    
    let reviewBtnImage = ["resultTinoReviewBtn", "resultYaguReviewBtn", "resultPaulReviewBtn"]
    
    var yaguEasyScore: Int = 0
    var yaguHardScore: Int = 0
    var tinoEasyScore: Int = 0
    var tinoHardScore: Int = 0
    var paulEasyScore: Int = 0
    var paulHardScore: Int = 0
    
}
