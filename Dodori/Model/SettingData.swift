//
//  SettingData.swift
//  Dodori
//
//  Created by 이재은 on 30/10/2018.
//  Copyright © 2018 SWUCOMPUTER. All rights reserved.
//

import Foundation

final class SettingData: NSObject {
    static let shared: SettingData = SettingData()
    
    var bgmSoundVolume: Float = 0.4
    var effectSoundVolume: Float = 1
    var mainBgmSoundVolume: Float = 1
}
