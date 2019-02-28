//
//  ViewData.swift
//  Dodori
//
//  Created by 이재은 on 2018. 7. 29..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//
import Foundation
import UIKit

class ViewData {
    static let shared: ViewData = ViewData()
    
    let pageNum = ["training_stage4_circle1", "training_stage4_circle2", "training_stage4_circle3"]
    
    var introID: String?
    var selectedStory: String? = "yagu"
    var selectedLevel: String? = "Easy"
    var selectedReview: String?
    
    func changeImage(storyBoardId: String) -> String {
        
        var introImageName : String
        switch storyBoardId {
        case "Test1View":
            introImageName = "introSp1"
        case "Test2View":
            introImageName = "introSp2"
        case "StoryView":
            introImageName = "introSp3"
        default:
            introImageName = "introSp4"
        }
        return introImageName
    }
}
