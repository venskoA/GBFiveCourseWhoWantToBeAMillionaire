//
//  Question.swift
//  GBCourseFive
//
//  Created by Andrey Vensko on 7.04.22.
//

import Foundation

struct Question: Codable {
    var question: String
    var answerOne: String
    var answerTwo: String
    var answerThree: String
    var answerFour: String
    var trueAnswer: Int
    var money: String
}
