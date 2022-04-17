//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Ryan Ginnow on 4/17/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct Question {
    let text: String
    let answer: String
    let image: UIImage?
    
    init(q: String, a: String, i: UIImage? = nil) {
        text = q
        answer = a
        image = i
    }
}
