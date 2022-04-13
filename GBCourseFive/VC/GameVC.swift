//
//  GameVC.swift
//  GBCourseFive
//
//  Created by Andrey Vensko on 7.04.22.
//

import Foundation
import UIKit

enum Difficulty {
    case medium
    case hard
    case custom
}

class GameVC: UIViewController {
    @IBOutlet weak var quastionLabel: UILabel!
    @IBOutlet weak var firstAnswer: UIButton!
    @IBOutlet weak var secondAnswer: UIButton!
    @IBOutlet weak var theerdAnswer: UIButton!
    @IBOutlet weak var fourAnswer: UIButton!
    @IBOutlet weak var nextQuestion: UIButton!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var numberTrueAnswer: UILabel!

    var complition: ((DataGame) -> ())?

    var difficulty: Difficulty = GameDifficultSingletone.shared.getDifficult()

    var trueFalse = true
    var numberInArr = 0
//    let questions = ArrQuestions().allQuestions()
    var questions: [Question]?
    var question: Question?

    var strategy: CreateStraetgyProtocolo {
        switch difficulty {
        case .medium:
            return QuestionInOrder()
        case .hard:
            return QuestionRandom()
        case .custom:
            return QuestionCansom()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createStart()
        GameSingletone.shared.number.addObserver(GameVC(), options: [.new]) { name, _ in
            self.numberTrueAnswer.text = "Number question \(name)"
        }
    }
}

extension GameVC {
    func createStart() {
        questions = strategy.createQuestion()

        question = questions?[numberInArr]
        createUI(question: question!)

        nextQuestion.setTitle("Next Question", for: .normal)
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
//        let uiNumber = numberInArr + 1
//        guard let questions = questions else { return }

        quastionLabel.numberOfLines = 0
        quastionLabel.text = date.question
        moneyLabel.text = "You can win = " + date.money + " rub"
        firstAnswer.setTitle(date.answerOne, for: .normal)
        secondAnswer.setTitle(date.answerTwo, for: .normal)
        theerdAnswer.setTitle(date.answerThree, for: .normal)
        fourAnswer.setTitle(date.answerFour, for: .normal)
    }

    func touchNextQuestion() {
        if view.backgroundColor == .green || view.backgroundColor == .red {
            guard let questions = questions else { return }
            view.backgroundColor = .white
            if trueFalse && numberInArr < questions.count - 1 {
                numberInArr += 1
                question = questions[numberInArr]
                guard let question = question else { return }
                createUI(question: question)
                GameSingletone.shared.number.value = String(numberInArr)
//                GameSingletone.shared.newObser(String(numberInArr))
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
        guard let questions = questions else { return }
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
