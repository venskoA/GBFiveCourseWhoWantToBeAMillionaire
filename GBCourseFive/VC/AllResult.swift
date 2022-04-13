//
//  AllResult.swift
//  GBCourseFive
//
//  Created by Andrey Vensko on 7.04.22.
//

import Foundation
import UIKit

class AllResult: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
    }
}

extension AllResult: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameSingletone.shared.datas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let value = GameSingletone.shared.datas[indexPath.row]
        cell.textLabel?.text = String(value.percent) + " " + value.winMoney
        return cell
    }
}
