//
//  CreateStrategy.swift
//  GBCourseFive
//
//  Created by Andrey Vensko on 9.04.22.
//

import Foundation

protocol CreateStraetgyProtocolo {
    func createQuestion() -> [Question]
}

class QuestionInOrder: CreateStraetgyProtocolo {
    func createQuestion() -> [Question] {
        return ArrQuestions().allQuestions()
    }
}

class QuestionRandom: CreateStraetgyProtocolo {
    func createQuestion() -> [Question] {
        var arrQuestion = ArrQuestions().allQuestions()
        arrQuestion = arrQuestion.shuffled()
        print(arrQuestion)
        return arrQuestion.shuffled()
    }
}

class QuestionCansom: CreateStraetgyProtocolo {
    func createQuestion() -> [Question] {
        let key = GameDifficultSingletone.shared.keyCastomDiff
        var arrQuestion = Memento().retrieveCastomQue(key: key)
        arrQuestion = arrQuestion.shuffled()
        return arrQuestion
    }
}
