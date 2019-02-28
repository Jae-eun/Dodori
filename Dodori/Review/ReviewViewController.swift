//
//  ReviewViewController.swift
//  Dodori
//
//  Created by 이재은 on 2018. 9. 1..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import AVFoundation

private let reuseIdentifier = "Cell"

class ReviewViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, AVAudioPlayerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var storyTitleImageView: UIImageView!
    @IBOutlet weak var wordReviewSelectedButton: UIButton!
    @IBOutlet weak var sentenceReviewSelectedButton: UIButton!
    @IBOutlet weak var wordReviewDeselectedButton: UIButton!
    @IBOutlet weak var sentenceReviewDeselectedButton: UIButton!
    @IBOutlet weak var zeroTestDataLabel: UILabel!
    
    var imageName: String = ""
    var storyTitleImageName: String = ""
    var testData: String = ""
    var count: Int = 0
    var isWordReview: Bool = true
    var pageNumberArray: [Int] = []

    
    @IBAction func goHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: false)
        ViewData.shared.selectedReview = nil
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    @IBAction func changeSentecenReview() {
        isWordReview = false
        receiveData()
        self.collectionView.reloadData()
        wordReviewSelectedButton.isHidden = true
        wordReviewDeselectedButton.isHidden = false
        sentenceReviewSelectedButton.isHidden = false
        sentenceReviewDeselectedButton.isHidden = true
    }
    
    @IBAction func changeWordReview() {
        isWordReview = true
        receiveData()
        self.collectionView.reloadData()
        wordReviewSelectedButton.isHidden = false
        wordReviewDeselectedButton.isHidden = true
        sentenceReviewSelectedButton.isHidden = true
        sentenceReviewDeselectedButton.isHidden = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ReviewCollectionViewCell else {
            return UICollectionViewCell()
        }
        if isWordReview == true {
            if testData == "tinoEasy" {
                imageName = Test1Data.shared.tinoEasyFileName[ReviewData.shared.tinoEasyWordReview[indexPath.row]]
                cell.reviewImage?.image = UIImage(named: imageName)
                cell.reviewText?.text = Test1Data.shared.tinoEasyTextArray[ReviewData.shared.tinoEasyWordReview[indexPath.row]]
            } else if testData == "tinoHard" {
                imageName = Test1Data.shared.tinoHardFileName[ReviewData.shared.tinoHardWordReview[indexPath.row]]
                cell.reviewImage?.image = UIImage(named: imageName)
                cell.reviewText?.text = Test1Data.shared.tinoHardTextArray[ReviewData.shared.tinoHardWordReview[indexPath.row]]
            } else if testData == "yaguEasy" {
                imageName = Test1Data.shared.yaguEasyFileName[ReviewData.shared.yaguEasyWordReview[indexPath.row]]
                cell.reviewImage?.image = UIImage(named: imageName)
                cell.reviewText?.text = Test1Data.shared.yaguEasyTextArray[ReviewData.shared.yaguEasyWordReview[indexPath.row]]
            } else if testData == "yaguHard" {
                imageName = Test1Data.shared.yaguHardFileName[ReviewData.shared.yaguHardWordReview[indexPath.row]]
                cell.reviewImage?.image = UIImage(named: imageName)
                    cell.reviewText?.text = Test1Data.shared.yaguHardTextArray[ReviewData.shared.yaguHardWordReview[indexPath.row]]
            } else if testData == "paulEasy" {
                imageName = Test1Data.shared.paulEasyFileName[ReviewData.shared.paulEasyWordReview[indexPath.row]]
                cell.reviewImage?.image = UIImage(named: imageName)
                cell.reviewText?.text = Test1Data.shared.paulEasyTextArray[ReviewData.shared.paulEasyWordReview[indexPath.row]]
            } else if testData == "paulHard" {
                imageName = Test1Data.shared.paulHardFileName[ReviewData.shared.paulHardWordReview[indexPath.row]]
                cell.reviewImage?.image = UIImage(named: imageName)
                cell.reviewText?.text = Test1Data.shared.paulHardTextArray[ReviewData.shared.paulHardWordReview[indexPath.row]]
            }
            cell.reviewText.font = cell.reviewText.font.withSize(28)
        } else if isWordReview == false {
            if testData == "tinoEasy" {
                imageName = Test2Data.shared.tinoEasyFileName[ReviewData.shared.tinoEasySentenceReview[indexPath.row]]
                cell.reviewImage?.image = UIImage(named: imageName)
                cell.reviewText?.text = Test2Data.shared.tinoEasyTextArray[ReviewData.shared.tinoEasySentenceReview[indexPath.row]]
            } else if testData == "tinoHard" {
                imageName = Test2Data.shared.tinoHardFileName[ReviewData.shared.tinoHardSentenceReview[indexPath.row]]
                cell.reviewImage?.image = UIImage(named: imageName)
                cell.reviewText?.text = Test2Data.shared.tinoHardTextArray[ReviewData.shared.tinoHardSentenceReview[indexPath.row]]
            } else if testData == "yaguEasy" {
                imageName = Test2Data.shared.yaguEasyFileName[ReviewData.shared.yaguEasySentenceReview[indexPath.row]]
                cell.reviewImage?.image = UIImage(named: imageName)
                cell.reviewText?.text = Test2Data.shared.yaguEasyTextArray[ReviewData.shared.yaguEasySentenceReview[indexPath.row]]
            } else if testData == "yaguHard" {
                imageName = Test2Data.shared.yaguHardFileName[ReviewData.shared.yaguHardSentenceReview[indexPath.row]]
                cell.reviewImage?.image = UIImage(named: imageName)
                cell.reviewText?.text = Test2Data.shared.yaguHardTextArray[ReviewData.shared.yaguHardSentenceReview[indexPath.row]]
            } else if testData == "paulEasy" {
                imageName = Test2Data.shared.paulEasyFileName[ReviewData.shared.paulEasySentenceReview[indexPath.row]]
                cell.reviewImage?.image = UIImage(named: imageName)
                cell.reviewText?.text = Test2Data.shared.paulEasyTextArray[ReviewData.shared.paulEasySentenceReview[indexPath.row]]
            } else if testData == "paulHard" {
                imageName = Test2Data.shared.paulHardFileName[ReviewData.shared.paulHardSentenceReview[indexPath.row]]
                cell.reviewImage?.image = UIImage(named: imageName)
                cell.reviewText?.text = Test2Data.shared.paulHardTextArray[ReviewData.shared.paulHardSentenceReview[indexPath.row]]
            }
            cell.reviewText.font = cell.reviewText.font.withSize(20)
            cell.reviewText.numberOfLines = 2;
        }
        cell.reviewImage.layer.masksToBounds = false
        cell.reviewImage.layer.cornerRadius = cell.reviewImage.frame.height/2
        cell.reviewImage.clipsToBounds = true
        
        return cell
    }
    
    @objc func didTouchUpMoveButton(_ sender: UIButton) {
        if isWordReview == true {
            if let view = self.storyboard?.instantiateViewController(withIdentifier: "WordPracticeView") {
                
                self.navigationController?.pushViewController(view, animated: false)
            }
        } else {
            if let view = self.storyboard?.instantiateViewController(withIdentifier: "SentencePracticeView") {
                self.navigationController?.pushViewController(view, animated: false)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? ReviewCollectionViewCell else { return }

            if cell.isSelected == true {
//                cell.layer.backgroundColor = UIColor.gray.cgColor
//                cell.layer.opacity = 0.7
                pressedBtn()
                ReviewData.shared.pageNumber = pageNumberArray[indexPath.item]
                ReviewData.shared.testData = testData
            }
        
        if isWordReview == true {
            if let view = self.storyboard?.instantiateViewController(withIdentifier: "WordPracticeView") {
                self.navigationController?.pushViewController(view, animated: false)
            }
        } else {
            if let view = self.storyboard?.instantiateViewController(withIdentifier: "SentencePracticeView") {
                self.navigationController?.pushViewController(view, animated: false)
            }
        }
    }
    
    func receiveData() {
        if ViewData.shared.selectedStory == "tino" {
            if ViewData.shared.selectedLevel == "easy" {
                testData = "tinoEasy"
                if isWordReview == true {
                    count = ReviewData.shared.tinoEasyWordReview.count
                    pageNumberArray = ReviewData.shared.tinoEasyWordReview
                } else {
                    count = ReviewData.shared.tinoEasySentenceReview.count
                    pageNumberArray = ReviewData.shared.tinoEasySentenceReview
                }
            }
            else if ViewData.shared.selectedLevel == "hard" {
                testData = "tinoHard"
                if isWordReview == true {
                    count = ReviewData.shared.tinoHardWordReview.count
                    pageNumberArray = ReviewData.shared.tinoHardWordReview
                } else {
                    count = ReviewData.shared.tinoHardSentenceReview.count
                    pageNumberArray = ReviewData.shared.tinoHardSentenceReview
                }
            }
        }
        else if ViewData.shared.selectedStory == "yagu" {
            if ViewData.shared.selectedLevel == "easy" {
                testData = "yaguEasy"
                if isWordReview == true {
                    count = ReviewData.shared.yaguEasyWordReview.count
                    pageNumberArray = ReviewData.shared.yaguEasyWordReview
                } else {
                    count = ReviewData.shared.yaguEasySentenceReview.count
                    pageNumberArray = ReviewData.shared.yaguEasySentenceReview
                }
            }
            else if ViewData.shared.selectedLevel == "hard" {
                testData = "yaguHard"
                if isWordReview == true {
                    count = ReviewData.shared.yaguHardWordReview.count
                    pageNumberArray = ReviewData.shared.yaguHardWordReview
                } else {
                    count = ReviewData.shared.yaguHardSentenceReview.count
                    pageNumberArray = ReviewData.shared.yaguHardSentenceReview
                }
            }
        }
        else if ViewData.shared.selectedStory == "paul" {
            if ViewData.shared.selectedLevel == "easy" {
                testData = "paulEasy"
                if isWordReview == true {
                    count = ReviewData.shared.paulEasyWordReview.count
                    pageNumberArray = ReviewData.shared.paulEasyWordReview
                } else {
                    count = ReviewData.shared.paulEasySentenceReview.count
                    pageNumberArray = ReviewData.shared.paulEasySentenceReview
                }
            }
            else if ViewData.shared.selectedLevel == "hard" {
                testData = "paulHard"
                if isWordReview == true {
                    count = ReviewData.shared.paulHardWordReview.count
                    pageNumberArray = ReviewData.shared.paulHardWordReview
                } else {
                    count = ReviewData.shared.paulHardSentenceReview.count
                    pageNumberArray = ReviewData.shared.paulHardSentenceReview
                }
            }
        }
        if count == 0 {
            zeroTestDataLabel.isHidden = false
        } else {
            zeroTestDataLabel.isHidden = true
        }
    }
    
    func setStoryName() {
        if ViewData.shared.selectedStory == "tino" {
            storyTitleImageName = "bookTitleTino"
        }

        else if ViewData.shared.selectedStory == "yagu" {
            storyTitleImageName = "bookTitleYagu"
        }

        else if ViewData.shared.selectedStory == "paul" {
           storyTitleImageName = "bookTitlePaul"
        }
        storyTitleImageView.image = UIImage(named: storyTitleImageName)
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
            self.audioPlayer?.delegate = self
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
  
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.reloadData()
        receiveData()
        setStoryName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
