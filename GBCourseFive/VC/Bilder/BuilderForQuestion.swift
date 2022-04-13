//
//  Bilder.swift
//  GBCourseFive
//
//  Created by Andrey Vensko on 10.04.22.
//

import Foundation

struct QuestionEnterOutsate {
    var question: Bool = false
    var answerOne: Bool = false
    var answerTwo: Bool = false
    var answerThree: Bool = false
    var answerFour: Bool = false
    var trueAnswer: Bool = false
}

class BuilderForQuestion {
    private var question = String()
    private var answerOne = String()
    private var answerTwo = String()
    private var answerThree = String()
    private var answerFour = String()
    private var trueAnswer = Int()
    private var money = " "

    enum MyError: Error {
        case DontHaveQuestion
    }

    private var arrEnterValueOutsate = QuestionEnterOutsate()

    func builder() -> Result<Question, Error> {
        if arrEnterValueOutsate.question == true &&
           arrEnterValueOutsate.answerOne == true &&
           arrEnterValueOutsate.answerTwo == true &&
           arrEnterValueOutsate.answerThree == true &&
           arrEnterValueOutsate.answerFour == true &&
           arrEnterValueOutsate.trueAnswer == true {
            return .success(Question(question: question,
                                     answerOne: answerOne,
                                     answerTwo: answerTwo,
                                     answerThree: answerThree,
                                     answerFour: answerFour,
                                     trueAnswer: trueAnswer,
                                     money: money))
        }
        return .failure(MyError.DontHaveQuestion)
    }

    func setQuestion(_ question: String?) {
        guard let question = question else { return }
        self.question = question
        arrEnterValueOutsate.question = true
    }

    func setAnswerOne(_ answerOne: String?) {
        guard let answerOne = answerOne else { return }
        self.answerOne = answerOne
        arrEnterValueOutsate.answerOne = true
    }

    func setAnswerTwo(_ answerTwo: String?) {
        guard let answerTwo = answerTwo else { return }
        self.answerTwo = answerTwo
        arrEnterValueOutsate.answerTwo = true
    }

    func setAnswerThree(_ answerThree: String?) {
        guard let answerThree = answerThree else { return }
        self.answerThree = answerThree
        arrEnterValueOutsate.answerThree = true
    }

    func setAnswerFour(_ answerFour: String?) {
        guard let answerFour = answerFour else { return }
        self.answerFour = answerFour
        arrEnterValueOutsate.answerFour = true
    }

    func setTrueAnswer(_ trueAnswer: String?) {
        guard let trueAnswer = trueAnswer,
              let intTrueAnswer = Int(trueAnswer) else { return }
        self.trueAnswer = intTrueAnswer
        arrEnterValueOutsate.trueAnswer = true
    }
}
