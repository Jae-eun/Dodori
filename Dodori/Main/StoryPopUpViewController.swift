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
    
//    func intro() {
//        guard let storyboardId = self.restorationIdentifier else { return }
//        
//        guard let vc =
//            storyboard?.instantiateViewController(withIdentifier: "IntroView") as? IntroViewController else { return }
//        vc.labelText = DataView.changeLabel(storyBoardId: storyboardId)
//        vc.view.backgroundColor = UIColor(white: 0, alpha: 0.75)
//        vc.modalPresentationStyle = .overCurrentContext
//        
//        self.present(vc, animated: false, completion: nil)
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let storyName = ViewData.shared.selectedStory else { return }
        storyPopUpImage.image = UIImage(named: PopUpData.shared.changeImage(storyName: storyName))

        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.dismiss(animated: false, completion: nil)
        
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
