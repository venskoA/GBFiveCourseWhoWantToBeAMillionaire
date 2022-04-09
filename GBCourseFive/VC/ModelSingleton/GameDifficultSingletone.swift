//
//  GameDifficultSingletone.swift
//  GBCourseFive
//
//  Created by Andrey Vensko on 9.04.22.
//

import Foundation

class GameDifficultSingletone {
    static let shared = GameDifficultSingletone()
    private var difficult: Difficulty = .medium
    let keyCastomDiff = "castom question"

    func getDifficult() -> Difficulty {
        return difficult
    }

    func createDifficult(_ diff: Difficulty) {
        difficult = diff
    }
    init() {}
}
