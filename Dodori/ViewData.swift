//
//  ViewData.swift
//  Dodori
//
//  Created by 이재은 on 2018. 7. 29..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//
import Foundation
import UIKit

let viewData: ViewData = ViewData()

//class ViewData: NSObject {
class ViewData {
    static let shared: ViewData = ViewData()
    
    var selectedStory: String?
    var selectedLevel: String?
}
