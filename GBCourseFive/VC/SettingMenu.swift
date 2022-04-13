//
//  SettingMenu.swift
//  GBCourseFive
//
//  Created by Andrey Vensko on 9.04.22.
//

import UIKit

class SettingMenu: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let levelArr = ["medium", "hight", "castom"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension SettingMenu: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levelArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = levelArr[indexPath.row]
        return cell
    }

    func tableView(_: UITableView, titleForHeaderInSection: Int) -> String? {
        return "Difficalt levels"
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            GameDifficultSingletone.shared.createDifficult(.medium)
        case 1:
            GameDifficultSingletone.shared.createDifficult(.hard)
        case 2:
            GameDifficultSingletone.shared.createDifficult(.custom)
        default:
            print("Not data")
        }
        dismiss(animated: true, completion: nil)
    }
}
