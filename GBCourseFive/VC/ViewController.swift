//
//  ViewController.swift
//  GBCourseFive
//
//  Created by Andrey Vensko on 7.04.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var dataLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        dataLabel.numberOfLines = 0
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "GameVC":
            guard let destination = segue.destination as? GameVC else { return }
            destination.complition = {[weak self] result in
                self?.dataLabel.text = "Number question = \(result.allQuestion), true answer = \(result.trueQuestion) "
            }
        default:
            break
        }
    }
}
