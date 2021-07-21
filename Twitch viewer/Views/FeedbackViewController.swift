//
//  FeedbackViewController.swift
//  Twitch viewer
//
//  Created by macbook on 21.07.2021.
//

import UIKit
import Cosmos

class FeedbackViewController: UIViewController {
    
    @IBOutlet weak var ratingbar: CosmosView!
    @IBOutlet weak var feedBackTextView: UITextView!
    
    //ratingbar.didFinishTouchingCosmos = { rating in }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ratingbar.rating = 4
    }
    

}
