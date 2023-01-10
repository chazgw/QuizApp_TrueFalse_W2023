//
//  QuizQuestion.swift
//  QuizApp
//
//  Created by Charles Wall on 12/16/21.
//  Copyright © 2021 Chaz. All rights reserved.
//

import Foundation

class QuizQuestion {
    
    
    // Data Members
    // "let" gives us a constant
    let question : String
    let answer : Bool
    
    // Constructor:
    init(question: String, answer: Bool) {
        
        self.question = question
        self.answer = answer
        
    }
    
    
    
}
