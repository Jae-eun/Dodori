//
//  LevelViewController.swift
//  Dodori
//
//  Created by 이재은 on 2018. 7. 29..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController {

    let Data0 = LevelData()
    var testData: String = ""
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var storyTitle: UIImageView!
    
    
    // 메인화면으로 이동
    @IBAction func goHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: false)
    }
    
    
    func receiveData() {
        if ViewData.shared.selectedStory == "tino" {
                testData = "tino"
        }
        else if ViewData.shared.selectedStory == "yagu" {
                testData = "yagu"
        }
        else if ViewData.shared.selectedStory == "paul" {
                testData = "paul"
        }
    }
    

    func sendData() {
        if testData == "tino" {
            let background: String = Data0.backgroundImage[0]
            backgroundImage.image = UIImage(named: background)
            let title: String = Data0.storyTitle[0]
            storyTitle.image = UIImage(named: title)
        }

        else if testData == "yagu" {
            let background: String = Data0.backgroundImage[1]
            backgroundImage.image = UIImage(named: background)
            let title: String = Data0.storyTitle[1]
            storyTitle.image = UIImage(named: title)
        }

        else if testData == "paul" {
            let background: String = Data0.backgroundImage[2]
            backgroundImage.image = UIImage(named: background)
            let title: String = Data0.storyTitle[2]
            storyTitle.image = UIImage(named: title)
        }
    }
    
    
    
    @IBAction func EasyBtn(_ sender: Any) {
        ViewData.shared.selectedLevel = "easy"
        changeView()
    }
    
    @IBAction func HardBtn(_ sender: Any) {
        ViewData.shared.selectedLevel = "hard"
        changeView()
    }
    
    func changeView() {
        if let view = self.storyboard?.instantiateViewController(withIdentifier: "IntroView") {
            self.navigationController?.pushViewController(view, animated:false)
        }
    }
    
    
//    if let view = self.storyboard?.instantiateViewController(withIdentifier: "Intro2") {
//        // 화면을 전환함
//        self.navigationController?.pushViewController(view, animated: false)
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        receiveData()
        sendData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
