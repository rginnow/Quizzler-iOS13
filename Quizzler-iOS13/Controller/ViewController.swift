//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
//  Updated by Ryan Ginnow on 4/17/2022
//  Enhancement: Add question images, Completion page

import UIKit
import Foundation

var quizBrain = QuizBrain()

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionImage: UIImageView!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerbuttonPressed(_ sender: UIButton) {

        let correct = quizBrain.checkAnswer(sender.currentTitle!)
        
        sender.backgroundColor = correct ? UIColor.systemGreen : UIColor.systemRed
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { [self] timer in
            if(quizBrain.nextQuestion()) {
                updateUI()
            } else {
                guard let completed = self.storyboard?.instantiateViewController(withIdentifier: "CompletedVC") as? CompletedController else { return }
                completed.callbackClosure = { [weak self] in
                    quizBrain.resetQuiz()
                    self!.updateUI()
                }
                present(completed, animated: true)
            }
            
            
            timer.invalidate()
        }
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
        questionImage.image = quizBrain.getQuestionImage()
        progressBar.progress = quizBrain.getProgress()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

