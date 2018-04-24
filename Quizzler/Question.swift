//
//  Question.swift
//  Quizzler
//
//  Created by Timothy De leon on 4/18/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation
//creates question class made of 2 objects, a questiontext string and answer boolean
class Question
{
    let questionText : String
    let answer : Bool
    
    init(text : String, correctAnswer : Bool)
    {
        //initializes as text and correct answer
        questionText = text
        answer = correctAnswer
    }
}


