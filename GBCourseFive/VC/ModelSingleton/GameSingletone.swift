//
//  GameSingletone.swift
//  GBCourseFive
//
//  Created by Andrey Vensko on 7.04.22.
//

import Foundation

class GameSingletone {
    let memento = Memento()

    static let shared = GameSingletone()

    private(set) var datas: [DataGame] = []{
        didSet {
            memento.save(data: datas.self)
            if datas.count > 4 {
                memento.remove()
                removeDate()
            }
        }
    }

    init() {
        datas = memento.retrieve()
    }

    func addDate(_ data: DataGame) {
        datas.append(data)
    }

    func removeDate() {
        datas = []
    }
}
