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

    func save(data: [DataGame], key: String) {
        do {
            let data = try encoder.encode(data)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("error")
        }
    }

    func retrieve(key: String) -> [DataGame] {
        guard let data: Data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            return try decoder.decode([DataGame].self, from: data)
        } catch {
            print("error")
            return []
        }
    }

    func saveCastomQue(data: [Question], key: String) {
        do {
            let data = try encoder.encode(data)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("error")
        }
    }

    func retrieveCastomQue(key: String) -> [Question] {
        guard let data: Data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            return try decoder.decode([Question].self, from: data)
        } catch {
            print("error")
            return []
        }
    }

    func remove(key: String) {
        UserDefaults.standard.removeSuite(named: key)
    }
}
