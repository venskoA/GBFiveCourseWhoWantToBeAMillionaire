//
//  AddCastonQuestion.swift
//  GBCourseFive
//
//  Created by Andrey Vensko on 9.04.22.
//

import Foundation
import UIKit

class AddCastonQuestion: UIViewController {
    @IBOutlet weak var quastionLabel: UITextField!
    @IBOutlet weak var answerFirstLabel: UITextField!
    @IBOutlet weak var answerSecondLabel: UITextField!
    @IBOutlet weak var answerTherdLabel: UITextField!
    @IBOutlet weak var answerFourdLabel: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var trueAnswer: UITextField!

    private let mementoPatern = Memento()
    private let key = GameDifficultSingletone.shared.keyCastomDiff

    private var arrQuestion: [Question] = [] {
        didSet {
            mementoPatern.saveCastomQue(data: arrQuestion.self, key: key)
            if arrQuestion.count > 5 {
                arrQuestion.removeFirst()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addButton.addTarget(self, action: #selector(addNewQuestion), for: .touchDown)
    }

    @objc
    func addNewQuestion() {
        arrQuestion = mementoPatern.retrieveCastomQue(key: key)

        guard let que = quastionLabel.text,
              let fir = answerFirstLabel.text,
              let sec = answerSecondLabel.text,
              let the = answerTherdLabel.text,
              let fou = answerFourdLabel.text,
              let tru = trueAnswer.text,
              let truInt = Int(tru)
        else { return }

        if truInt > 0 && truInt < 5 {
            let question = Question(question: que,
                                    answerOne: fir,
                                    answerTwo: sec,
                                    answerThree: the,
                                    answerFour: fou,
                                    trueAnswer: truInt,
                                    money: " ")
            
            arrQuestion.append(question)
            print(mementoPatern.retrieveCastomQue(key: key))
            dismiss(animated: true, completion: nil)
        }
    }
}
