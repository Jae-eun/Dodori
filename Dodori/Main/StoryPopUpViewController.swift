//
//  StoryPopUpViewController.swift
//  Dodori
//
//  Created by 이재은 on 2018. 9. 18..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class StoryPopUpViewController: UIViewController {

    @IBOutlet weak var storyPopUpImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let storyName = ViewData.shared.selectedStory else { return }
        storyPopUpImage.image = UIImage(named: PopUpData.shared.changeStoryImage(storyName: storyName))

        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.dismiss(animated: false, completion: nil)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
