//
//  AddCastomQuestionCell.swift
//  GBCourseFive
//
//  Created by Andrey Vensko on 10.04.22.
//

import Foundation
import UIKit

class AddCastomQuestionCell: UITableViewCell {
    let enterTextField = UITextField()
    let registerTableView = "AddCastomQuestionCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createUI()
        enterTextField.addTarget(self, action: #selector(passShadow(_:)), for: .touchDown)
    }

    @objc
    func passShadow(_ textField: UITextField) {
        print("ngejknk")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddCastomQuestionCell {
    private func createUI() {
        enterTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(enterTextField)
        enterTextField.backgroundColor = .systemTeal

        NSLayoutConstraint.activate([
            enterTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            enterTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            enterTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            enterTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}

