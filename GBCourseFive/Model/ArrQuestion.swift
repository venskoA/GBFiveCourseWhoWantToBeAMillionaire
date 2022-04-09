//
//  ArrQuestion.swift
//  GBCourseFive
//
//  Created by Andrey Vensko on 9.04.22.
//

import Foundation

struct ArrQuestions {
    let firstQuestion = Question(question: "На каком инструменте, как считается, играл древнерусский певец и сказитель Боян?", answerOne: "На гуслях", answerTwo: "На виолончели", answerThree: "На баяне", answerFour: "На гитаре", trueAnswer: 1, money: "50")
    let secondQuestion = Question(question: "В какой из этих стран один из официальных языков - французский?", answerOne: "Республика Гаити", answerTwo: "Кения", answerThree: "Эквадор", answerFour: "Венесуэла", trueAnswer: 1, money: "300")
    let therdQuestion = Question(question: "В каком году произошла Куликовская битва?", answerOne: "1773", answerTwo: "1569", answerThree: "1616", answerFour: "1380", trueAnswer: 4, money: "1500")
    let fourQuestion = Question(question: "Какая картина Малевича находится в Русском музее?", answerOne: "Белый квадрат", answerTwo: "Красный квадрат", answerThree: "Чёрный квадрат", answerFour: "Точильщик", trueAnswer: 2, money: "5000")
    let fiveQuestion = Question(question: "Как называется самая глубокая точка поверхности Земли, находящаяся на дне Марианской впадины?", answerOne: "Филиппинская плита", answerTwo: "Кермадек", answerThree: "Бездна Челленджера", answerFour: "Черное Логово", trueAnswer: 3, money: "30000")

    func allQuestions() -> [Question] {
        return [firstQuestion, secondQuestion, therdQuestion, fourQuestion, fiveQuestion]
    }
}
