//
//  MainViewController.swift
//  Dodori
//
//  Created by 이재은 on 2018. 7. 29..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBAction func tinoBtn(_ sender: Any) {
        ViewData.shared.selectedStory = "tino"
        self.changeView()
    }
        
    @IBAction func yaguBtn(_ sender: Any) {
        ViewData.shared.selectedStory = "yagu"
        self.changeView()
    }
    
    @IBAction func paulBtn(_ sender: Any) {
        ViewData.shared.selectedStory = "paul"
        self.changeView()
    }
    
    func changeView() {
        if let view = self.storyboard?.instantiateViewController(withIdentifier: "LevelView") {
            self.navigationController?.pushViewController(view, animated:false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
