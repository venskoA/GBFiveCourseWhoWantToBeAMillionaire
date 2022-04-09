//
//  GameVC.swift
//  GBCourseFive
//
//  Created by Andrey Vensko on 7.04.22.
//

import Foundation
import UIKit

class GameVC: UIViewController {

    @IBOutlet weak var quastionLabel: UILabel!
    @IBOutlet weak var firstAnswer: UIButton!
    @IBOutlet weak var secondAnswer: UIButton!
    @IBOutlet weak var theerdAnswer: UIButton!
    @IBOutlet weak var fourAnswer: UIButton!
    @IBOutlet weak var nextQuestion: UIButton!
    @IBOutlet weak var moneyLabel: UILabel!

    var complition: ((DataGame) -> ())?

    var trueFalse = true
    var numberInArr = 0
    let questions = ArrQuestions().allQuestions()
    var question: Question?

    override func viewDidLoad() {
        super.viewDidLoad()
        createStart()
    }
}

extension GameVC {

    func createStart() {
        nextQuestion.setTitle("Next Question", for: .normal)

        question = questions[numberInArr]
        createUI(question: question!)

        firstAnswer.tag = 1
        secondAnswer.tag = 2
        theerdAnswer.tag = 3
        fourAnswer.tag = 4

        firstAnswer.addTarget(self, action: #selector(touchButton(_:)), for: .touchDown)
        secondAnswer.addTarget(self, action: #selector(touchButton(_:)), for: .touchDown)
        theerdAnswer.addTarget(self, action: #selector(touchButton(_:)), for: .touchDown)
        fourAnswer.addTarget(self, action: #selector(touchButton(_:)), for: .touchDown)
        nextQuestion.addTarget(self, action: #selector(touchButton(_:)), for: .touchDown)
    }

    @objc
    func touchButton(_ button: UIButton) {
        switch button {
        case firstAnswer:
            processing(firstAnswer)
        case secondAnswer:
            processing(secondAnswer)
        case theerdAnswer:
            processing(theerdAnswer)
        case fourAnswer:
            processing(fourAnswer)
        case nextQuestion:
            touchNextQuestion()
        default:
            break
        }
    }

    func createUI(question date: Question) {
        quastionLabel.numberOfLines = 0
        quastionLabel.text = date.question
        moneyLabel.text = "You can win = " + date.money + "rub"
        firstAnswer.setTitle(date.answerOne, for: .normal)
        secondAnswer.setTitle(date.answerTwo, for: .normal)
        theerdAnswer.setTitle(date.answerThree, for: .normal)
        fourAnswer.setTitle(date.answerFour, for: .normal)
    }

    func touchNextQuestion() {
        if view.backgroundColor == .green || view.backgroundColor == .red {
            view.backgroundColor = .white
            if trueFalse && numberInArr < questions.count - 1 {
                numberInArr += 1
                question = questions[numberInArr]
                guard let question = question else { return }
                createUI(question: question)
            }
            else {
                addInSingletone()
                dismiss(animated: true, completion: nil)
            }
        }
    }

    func processing(_ button: UIButton) {
        guard let question = question else { return }
        if button.tag == question.trueAnswer {
            view.backgroundColor = .green
            trueFalse = true
        } else {
            addInSingletone()
            view.backgroundColor = .red
            DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }

    func addInSingletone() {
        let percent = (Double(numberInArr) / Double(questions.count)) * 100
        var winMoney = String()

        if numberInArr > 0 {
            winMoney = questions[numberInArr].money
        } else {
            winMoney = "0"
        }
        let record = DataGame(allQuestion: questions.count, trueQuestion: numberInArr, percent: percent, winMoney: winMoney)
        GameSingletone.shared.addDate(record)
        complition?(record)
    }
}
