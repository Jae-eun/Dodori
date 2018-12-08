//
//  ReviewViewController.swift
//  Dodori
//
//  Created by 이재은 on 2018. 9. 1..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ReviewViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var storyNameLabel: UILabel!
    @IBOutlet weak var StepNameLabel: UILabel!
    
    var testData: String = ""
    var count = 0
    
    @IBAction func goHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: false)
        ViewData.shared.selectedReview = nil
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return count
        //        return Test2Data.shared.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ReviewCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if testData == "tinoEasy" {
            let imageName = Test1Data.shared.tinoEasyFileName[Test1Data.shared.tinoEasyReview[indexPath.row]]
            cell.reviewImage?.image = UIImage(named: imageName)
            cell.reviewText?.text = Test1Data.shared.tinoEasyTextArray[Test1Data.shared.tinoEasyReview[indexPath.row]]
        } else if testData == "tinoHard" {
            let imageName = Test1Data.shared.tinoHardFileName[Test1Data.shared.tinoHardReview[indexPath.row]]
            cell.reviewImage?.image = UIImage(named: imageName)
            cell.reviewText?.text = Test1Data.shared.tinoHardTextArray[Test1Data.shared.tinoHardReview[indexPath.row]]
        } else if testData == "yaguEasy" {
            let imageName = Test1Data.shared.yaguEasyFileName[Test1Data.shared.yaguEasyReview[indexPath.row]]
            cell.reviewImage?.image = UIImage(named: imageName)
            cell.reviewText?.text = Test1Data.shared.yaguEasyTextArray[Test1Data.shared.yaguEasyReview[indexPath.row]]
        } else if testData == "yaguHard" {
            let imageName = Test1Data.shared.yaguHardFileName[Test1Data.shared.yaguHardReview[indexPath.row]]
            cell.reviewImage?.image = UIImage(named: imageName)
            cell.reviewText?.text = Test1Data.shared.yaguHardTextArray[Test1Data.shared.yaguHardReview[indexPath.row]]
        } else if testData == "paulEasy" {
            let imageName = Test1Data.shared.paulEasyFileName[Test1Data.shared.paulEasyReview[indexPath.row]]
            cell.reviewImage?.image = UIImage(named: imageName)
            cell.reviewText?.text = Test1Data.shared.paulEasyTextArray[Test1Data.shared.paulEasyReview[indexPath.row]]
        } else if testData == "paulHard" {
            let imageName = Test1Data.shared.paulHardFileName[Test1Data.shared.paulHardReview[indexPath.row]]
            cell.reviewImage?.image = UIImage(named: imageName)
            cell.reviewText?.text = Test1Data.shared.paulHardTextArray[Test1Data.shared.paulHardReview[indexPath.row]]
        }
        
        // Configure the cell
        
        return cell
    }
    
//        func showData() {
//            let review = reviewData[indexPath.row]
//            var display: String = ""
//
//            if let pageNum = review.value(value(forKey: "word") as? Int {
//                    display = reviewWordaLabel
//            }
//
//        }
    

    
    func receiveData() {
        if ViewData.shared.selectedStory == "tino" {
            if ViewData.shared.selectedLevel == "easy" {
                testData = "tinoEasy"
                count = Test1Data.shared.tinoEasyReview.count
            }
            else if ViewData.shared.selectedLevel == "hard" {
                testData = "tinoHard"
                count = Test1Data.shared.tinoHardReview.count
            }
        }
        else if ViewData.shared.selectedStory == "yagu" {
            if ViewData.shared.selectedLevel == "easy" {
                testData = "yaguEasy"
                count = Test1Data.shared.yaguEasyReview.count
            }
            else if ViewData.shared.selectedLevel == "hard" {
                testData = "yaguHard"
                count = Test1Data.shared.yaguHardReview.count
            }
        }
        else if ViewData.shared.selectedStory == "paul" {
            if ViewData.shared.selectedLevel == "easy" {
                testData = "paulEasy"
                count = Test1Data.shared.paulEasyReview.count
            }
            else if ViewData.shared.selectedLevel == "hard" {
                testData = "paulHard"
                count = Test1Data.shared.paulHardReview.count
            }
        }
    }
    
    
    func sendData() {
        if ViewData.shared.selectedStory == "tino" {
            storyNameLabel.text = "내 보물 1호 티노"
        }

        else if ViewData.shared.selectedStory == "yagu" {
            storyNameLabel.text = "야구공"
        }

        else if ViewData.shared.selectedStory == "paul" {
           storyNameLabel.text = "안녕, 폴"
        }
    }
    
    @IBAction func goTestPage(_ sender: Any) {
        if let view = self.storyboard?.instantiateViewController(withIdentifier: "Test1ReviewView") {
            // 화면을 전환함
            self.navigationController?.pushViewController(view, animated: false)
        }
//        ReviewData.shared.pageNumber = self.
    }
    
//        func showReview() {
//            var wordNum = YaguReviewData.shared.reviewWord
//            //var sentenceNum = YaguReviewData.shared.reviewSentence
//
//            for i in 0...wordNum.count {
//                reviewWordaLabel.text = Test1Data.shared.tinoEasyTextArray[wordNum[i]]
//                //        reviewSentenceLabel.text =
//            }
//
//        }

    
    override func viewDidLoad() {
        super.viewDidLoad()
                collectionView.reloadData()
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
