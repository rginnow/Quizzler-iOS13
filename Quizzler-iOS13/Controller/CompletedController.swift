//
//  CompletedController.swift
//  Quizzler-iOS13
//
//  Created by Ryan Ginnow on 4/17/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit
import Foundation

class CompletedController: UIViewController {
    
    @IBOutlet weak var finalScoreLabel: UILabel!
    @IBOutlet weak var tryAgainButton: UIButton!
    
    var callbackClosure: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finalScoreLabel.text = "Final Score: \(quizBrain.getScore())"
    }

    override func viewWillDisappear(_ animated: Bool) {
       callbackClosure?()
    }
    
    @IBAction func tryAgainPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
