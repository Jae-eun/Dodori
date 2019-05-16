//
//  SettingViewController.swift
//  Dodori
//
//  Created by 이재은 on 2018. 8. 28..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import AVFoundation

// 설정 화면
final class SettingViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AVAudioPlayerDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var bgmSwitchButton: UIButton!
    @IBOutlet var effectSoundSwitchButton: UIButton!
    
//    let items: Array<String> = ["배경음악", "효과음", "훈련 기록 초기화", "서비스 이용약관", "개인정보 취급방침"]
    let imageName: Array<String> = ["setting_bgm_on", "setting_ebgm_on", "setting_next", "setting_next", "setting_next"]
    let cellIdentifier: Array<String> = ["BGMCell", "EffectSoundCell", "DeleteCell", "ServiceCell", "UserInfoCell"]
    var buttonImageName: String = ""
    var isBgmSoundOn: Bool = true
    var isEffectSoundOn: Bool = true

    
    @IBAction func goHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.cellIdentifier.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows

        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      let section = indexPath.section
        
        guard let cell: SettingTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier[section], for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }
    
//        switch section {
//        case 0:
//            cell as? BGMCell
//        case 1:
//            cell as? EffectSoundCell
//        case 2:
//            cell as? DeleteCell
//        case 3:
//            cell as? ServiceCell
//        case 4:
//            cell as? UserInfoCell
//        default:
//            break
//        }
//        switch section {
//        case 0:
//            (cell as? BGMCell)?.setProperties()
//        case 1:
//            (cell as? EffectSoundCell)?.setProperties()
//        case 2:
//            (cell as? DeleteCell)?.setProperties()
//        case 3:
//            (cell as? ServiceCell)?.setProperties()
//        case 4:
//            (cell as? UserInfoCell)?.setProperties()
//        default:
//            break
//        }
//        let item = self.items[indexPath.row]
//        print(item)
//        cell.titleLabel?.text = item
//
//        switch indexPath.row {
//        case 0:
//            cell.subscriptLabel?.text = "배경음악을 설정할 수 있어요."
////            buttonImageName = "setting_bgm_on"
//        case 1:
//            cell.subscriptLabel?.text = "효과음을 설정할 수 있어요."
////            buttonImageName = "setting_ebgm_on"
//        case 2:
//            cell.subscriptLabel?.text = nil
////            buttonImageName = "setting_delete"
//        default:
//            cell.subscriptLabel?.text = nil
////            buttonImageName = "setting_next"
//        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    

    
    @IBAction func setBgmSoundVolume() {
        guard let cell: SettingTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier[0]) as? SettingTableViewCell else { return }
        
        if isBgmSoundOn == true {
            cell.bgmSwitchButton.setImage(UIImage(named: "setting_bgm_off"), for: UIControlState.focused)
            SettingData.shared.bgmSoundVolume = 0
            SettingData.shared.mainBgmSoundVolume = 0
            isBgmSoundOn = false
        } else {
            cell.bgmSwitchButton.setImage(UIImage(named: "setting_bgm_on"), for: UIControlState.normal)
            SettingData.shared.bgmSoundVolume = 0.2
            SettingData.shared.mainBgmSoundVolume = 1
            isBgmSoundOn = true
        }
//        isBgmSoundOn = !isBgmSoundOn
    }
    
    @IBAction func setEffectSoundVolume() {
        guard let cell: SettingTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier[1]) as? SettingTableViewCell else { return }
        
        if isEffectSoundOn == true {
            cell.effectSoundSwitchButton.setImage(UIImage(named: "setting_ebgm_off"), for: UIControlState.normal)
            SettingData.shared.effectSoundVolume = 0
        } else {
            cell.effectSoundSwitchButton.setImage(UIImage(named: "setting_ebgm_on"), for: UIControlState.normal)
            SettingData.shared.effectSoundVolume = 1
        }
        isEffectSoundOn = !isEffectSoundOn
    }
    
    @IBAction func deleteReviewData() {
        ReviewData.shared.yaguEasyWordReview = [0,1,2,3,4,5,6,7,8,9]
        ReviewData.shared.yaguHardWordReview = [0,1,2,3,4,5,6,7,8,9]
        ReviewData.shared.tinoEasyWordReview = [0,1,2,3,4,5,6,7,8,9]
        ReviewData.shared.tinoHardWordReview = []
        ReviewData.shared.paulEasyWordReview = [0,1,2,3,4,5,6,7,8,9]
        ReviewData.shared.paulHardWordReview = [0,1,2,3,4,5,6,7,8,9]
        ReviewData.shared.yaguEasySentenceReview = [0,1,2,3,4,5,6,7,8,9]
        ReviewData.shared.yaguHardSentenceReview = [0,1,2,3,4,5,6,7,8,9]
        ReviewData.shared.tinoEasySentenceReview = [0,1,2,3,4,5,6,7,8,9]
        ReviewData.shared.tinoHardSentenceReview = []
        ReviewData.shared.paulEasySentenceReview = [0,1,2,3,4,5,6,7,8,9]
        ReviewData.shared.paulHardSentenceReview = [0,1,2,3,4,5,6,7,8,9]
        
        ResultData.shared.yaguEasyScore = 0
        ResultData.shared.yaguHardScore = 0
        ResultData.shared.tinoEasyScore = 0
        ResultData.shared.tinoHardScore = 0
        ResultData.shared.paulEasyScore = 0
        ResultData.shared.paulHardScore = 0
    }
    
    var audioPlayer: AVAudioPlayer?
    var effectSoundName: String = ""

    func initializePlayer() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: effectSoundName) else {
            print("음원 파일 에셋을 가져올 수 없습니다")
            return
        }
        do {
            try self.audioPlayer = AVAudioPlayer(data: soundAsset.data)
            self.audioPlayer!.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
    }

    func pressedBtn() {
        effectSoundName = "1.app-button"
        initializePlayer()
        self.audioPlayer?.play()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        guard let nextViewController: DetailWeatherViewController = segue.destination as? DetailWeatherViewController else { return }
//
//        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
//
//        let city = self.weather[selectedIndexPath.row]
//
//        nextViewController.title = city.cityName
//
//        nextViewController.weatherState = city.state
//        nextViewController.celsiusState = city.celsius
//        nextViewController.rainfallProbabilityState = city.rainfallProbability
//
//    }
    

}
