//
//  PopUpData.swift
//  Dodori
//
//  Created by 이재은 on 2018. 9. 18..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import Foundation
import UIKit

class PopUpData {
    static let shared: PopUpData = PopUpData()
    
    var introID: String?
    var selectedStory: String?
    var selectedLevel: String?
    var selectedReview: String?
    var popUpImageName: String = ""
    var popUpSoundName: String = ""

    func changeStoryImage(storyName: String) -> String {
        
            switch storyName {
            case "yagu":
                popUpImageName = "popup_yagu_box"
            case "tino":
                popUpImageName = "popup_tino_box"
            default:
                popUpImageName = "popup_paul_box"
            }
        return popUpImageName
    }
    
    func changeIntroSound(storyBoardId: String) -> String  {
        
        switch storyBoardId {
        case "Test1View":
            popUpSoundName = "dodori_word_intro"
        case "Test2View":
            popUpSoundName = "dodori_sentence_intro"
        case "StoryView":
            popUpSoundName = "dodori_story_intro"
        default:
            popUpSoundName = "dodori_quiz_intro"
        }
        return popUpSoundName
    }
    
    
    func changeIncorrectImage(storyBoardId: String) -> String  {

        switch storyBoardId {
        case "QuizView":
            popUpImageName = "popup_repeat_chance_box"
        default:
             popUpImageName = "popup_training_chance_box"
        }
        return popUpImageName
    }
    
    func changeIncorrectSound(storyBoardId: String) -> String  {
        
        switch storyBoardId {
        case "QuizView":
            popUpSoundName = "dodori_quiz_wrong"
        default:
            popUpSoundName = "dodori_no_heart"
        }
        return popUpSoundName
    }
    
}
