//
//  Memento.swift
//  GBCourseFive
//
//  Created by Andrey Vensko on 7.04.22.
//

import Foundation

class Memento {
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()

    private let gameKey = "gameKey"

    func save(data: [DataGame]) {
        do {
            let data = try encoder.encode(data)
            UserDefaults.standard.set(data, forKey: gameKey)
        } catch {
            print("error")
        }
    }

    func retrieve() -> [DataGame] {
        guard let data: Data = UserDefaults.standard.data(forKey: gameKey) else { return [] }
        do {
            return try decoder.decode([DataGame].self, from: data)
        } catch {
            print("error")
            return []
        }
    }

    func remove() {
        UserDefaults.standard.removeSuite(named: gameKey)
    }
}
