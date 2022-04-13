//
//  AddCastomQuestionTV.swift
//  GBCourseFive
//
//  Created by Andrey Vensko on 10.04.22.
//

import Foundation
import UIKit

class AddCastomQuestionTV: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    let registerTableView = "AddCastomQuestionCell"

    private let numberSection = 5
    let builder = BuilderForQuestion()

    private let key = GameDifficultSingletone.shared.keyCastomDiff
    private let mementoPatern = Memento()
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
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AddCastomQuestionCell.self, forCellReuseIdentifier: registerTableView)
        addButton.addTarget(self, action: #selector(touchAddButton), for: .touchDown)
    }

    @objc
    func touchAddButton() {
        let res = builder.builder()
        switch res {
        case .success(let question):
            arrQuestion = mementoPatern.retrieveCastomQue(key: key)
            arrQuestion.append(question)
            dismiss(animated: true, completion: nil)
        case .failure(let error):
            print(error)
        }
    }
}

extension AddCastomQuestionTV: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberSection
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: registerTableView, for: indexPath) as? AddCastomQuestionCell else { return UITableViewCell() }
        switch indexPath.row {
        case 0:
            cell.enterTextField.placeholder = "setQuestion"
            builder.setQuestion(cell.enterTextField.text)
        case 1:
            cell.enterTextField.placeholder = "setAnswerOne"
            builder.setAnswerOne(cell.enterTextField.text)
        case 2:
            cell.enterTextField.placeholder = "setAnswerTwo"
            builder.setAnswerTwo(cell.enterTextField.text)
        case 3:
            cell.enterTextField.placeholder = "setAnswerThree"
            builder.setAnswerThree(cell.enterTextField.text)
        case 4:
            cell.enterTextField.placeholder = "setAnswerFour"
            builder.setAnswerFour(cell.enterTextField.text)
        case 5:
            cell.enterTextField.placeholder = "setTrueAnswer"
            builder.setTrueAnswer(cell.enterTextField.text)
        default:
            print("NotData")
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
}
