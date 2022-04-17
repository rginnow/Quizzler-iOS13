//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Ryan Ginnow on 4/17/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct QuizBrain {
    let quizQuestions = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True", i: UIImage(named: "west_virginia")),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False", i: UIImage(named: "cow")),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True", i: UIImage(named: "moon")),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    var currentQuestion = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        let correct = quizQuestions[currentQuestion].answer == userAnswer
        if(correct) {
            score += 1
        }
        return correct
    }
    
    func getQuestionImage() -> UIImage? {
        return quizQuestions[currentQuestion].image ?? nil
    }
    
    func getQuestionText() -> String {
        return quizQuestions[currentQuestion].text
    }
    
    func getProgress() -> Float {
        return Float(currentQuestion + 1) / Float(quizQuestions.count)
    }
    
    func getScore() -> Int {
        return score
    }
    
    mutating func nextQuestion() -> Bool {
        if(currentQuestion + 1 < quizQuestions.count) {
            currentQuestion += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func resetQuiz() {
        currentQuestion = 0
        score = 0
    }
}
