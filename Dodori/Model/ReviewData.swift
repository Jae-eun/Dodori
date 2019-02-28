//
//  ReviewData.swift
//  Dodori
//
//  Created by 이재은 on 2018. 8. 12..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import Foundation

class ReviewData: NSObject {
    static let shared: ReviewData = ReviewData()
    
    var pageNumber: Int?
    var testData: String?
    
    var yaguEasyWordReview: Array<Int> = [4,5,6,7,8,9]
    var yaguHardWordReview: Array<Int> = [0,1,2,3,4,5,6,7,8,9]
    var tinoEasyWordReview: Array<Int> = [0,1,2,3,4,5,6,7,8,9]
    var tinoHardWordReview: Array<Int> = [0,1,2,3,4,5,6,7,8,9]
    var paulEasyWordReview: Array<Int> = [0,1,2,3,4,5,6,7,8,9]
    var paulHardWordReview: Array<Int> = [0,1,2,3,4,5,6,7,8,9]
    
    var yaguEasySentenceReview: Array<Int> = [0,1,2,3,4,5,6,7,8,9]
    var yaguHardSentenceReview: Array<Int> = [0,1,2,3,4,5,6,7,8,9]
    var tinoEasySentenceReview: Array<Int> = [0,1,2,3,4,5,6,7,8,9]
    var tinoHardSentenceReview: Array<Int> = [0,1,2,3,4,5,6,7,8,9]
    var paulEasySentenceReview: Array<Int> = [0,1,2,3,4,5,6,7,8,9]
    var paulHardSentenceReview: Array<Int> = [0,1,2,3,4,5,6,7,8,9]
}
