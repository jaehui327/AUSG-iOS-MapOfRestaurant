//
//  SetStarViewController.swift
//  MapOfFamousRestaurant
//
//  Created by JHKim on 27/06/2019.
//  Copyright © 2019 JHKim. All rights reserved.
//

import UIKit

class SetStarViewController: UIViewController {
    
    var ratingModel: RatingService?
    
    var id: Int = 0
    
    var starNum = 0
    
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    @IBOutlet weak var sendButton: UIButton!
    
    @IBAction func sendRating(_ sender: Any) {
        ratingModel?.postRatingInformation(rating: Double(starNum), locationId: id) { RatingInformation in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingModel = RatingService()
        
        star1.isUserInteractionEnabled = true
        star2.isUserInteractionEnabled = true
        star3.isUserInteractionEnabled = true
        star4.isUserInteractionEnabled = true
        star5.isUserInteractionEnabled = true
        
        let gesture1 = UITapGestureRecognizer(target: self, action: #selector(tappedStar(_:)))
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(tappedStar(_:)))
        let gesture3 = UITapGestureRecognizer(target: self, action: #selector(tappedStar(_:)))
        let gesture4 = UITapGestureRecognizer(target: self, action: #selector(tappedStar(_:)))
        let gesture5 = UITapGestureRecognizer(target: self, action: #selector(tappedStar(_:)))
        star1.addGestureRecognizer(gesture1)
        star2.addGestureRecognizer(gesture2)
        star3.addGestureRecognizer(gesture3)
        star4.addGestureRecognizer(gesture4)
        star5.addGestureRecognizer(gesture5)
        // Do any additional setup after loading the view.
    }
    
    @objc private func tappedStar(_ sender: UITapGestureRecognizer) {
        starNum = sender.view?.tag ?? 0
        print(starNum)
        fillStar()
    }
    
    func fillStar() {
        if starNum == 1 {
            star1.image = UIImage(named: "full_star")
            star2.image = UIImage(named: "empty_star")
            star3.image = UIImage(named: "empty_star")
            star4.image = UIImage(named: "empty_star")
            star5.image = UIImage(named: "empty_star")
            
        } else if starNum == 2 {
            star1.image = UIImage(named: "full_star")
            star2.image = UIImage(named: "full_star")
            star3.image = UIImage(named: "empty_star")
            star4.image = UIImage(named: "empty_star")
            star5.image = UIImage(named: "empty_star")
            
        } else if starNum == 3 {
            star1.image = UIImage(named: "full_star")
            star2.image = UIImage(named: "full_star")
            star3.image = UIImage(named: "full_star")
            star4.image = UIImage(named: "empty_star")
            star5.image = UIImage(named: "empty_star")
            
        } else if starNum == 4 {
            star1.image = UIImage(named: "full_star")
            star2.image = UIImage(named: "full_star")
            star3.image = UIImage(named: "full_star")
            star4.image = UIImage(named: "full_star")
            star5.image = UIImage(named: "empty_star")
            
        } else if starNum == 5 {
            star1.image = UIImage(named: "full_star")
            star2.image = UIImage(named: "full_star")
            star3.image = UIImage(named: "full_star")
            star4.image = UIImage(named: "full_star")
            star5.image = UIImage(named: "full_star")
            
        }
    }
    
}
