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
    var number: Observable<String> = Observable("1")

    private(set) var datas: [DataGame] = []{
        didSet {
            memento.save(data: datas.self, key: "gameKey")
            if datas.count > 4 {
                memento.remove(key: "gameKey")
                removeDate()
            }
        }
    }

    init() {
        datas = memento.retrieve(key: "gameKey")
    }

    func addDate(_ data: DataGame) {
        datas.append(data)
    }

    func newObser(_ number: String) {
        self.number = Observable(number)
    }

    func removeDate() {
        datas = []
    }
}
