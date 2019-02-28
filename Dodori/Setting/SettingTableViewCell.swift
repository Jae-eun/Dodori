//
//  SettingTableViewCell.swift
//  Dodori
//
//  Created by 이재은 on 29/10/2018.
//  Copyright © 2018 SWUCOMPUTER. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subscriptLabel: UILabel!
    @IBOutlet weak var bgmSwitchButton: UIButton!
    @IBOutlet weak var effectSoundSwitchButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var serviceButton: UIButton!
    @IBOutlet weak var userInfoButton: UIButton!
    
//    func setProperties(_ object: UserInfoResponse.Data?) {
//        guard let object = object else { return }
//        nickNameLabel.text = object.nickname
//        gradeLabel.text = Grade(rawValue: object.grade)?.expression
//
//      
//        guard let url = URL(string: imageUrl) else { return }
//        guard let data = try? Data(contentsOf: url) else { return }
//        profileImageView.image = UIImage(data: data)
//        profileImageView.layer.masksToBounds = false
//        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
//        profileImageView.clipsToBounds = true
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
