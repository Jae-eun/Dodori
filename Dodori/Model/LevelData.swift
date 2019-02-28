//
//  LevelData.swift
//  Dodori
//
//  Created by 이재은 on 2018. 8. 5..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import Foundation
import UIKit

class LevelData: NSObject {
    static let shared: LevelData = LevelData()
    
    let backgroundImage = ["tino_level_background", "yagu_level_background", "paul_level_background"]
    
    let storyTitle = ["levelTinoTitle", "level_yagu_title", "level_paul_title"]
}
