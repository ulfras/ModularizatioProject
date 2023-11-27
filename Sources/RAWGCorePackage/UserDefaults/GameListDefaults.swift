//
//  GameListUserDefaults.swift
//  CatalogApp
//
//  Created by Maulana Frasha on 14/11/23.
//

import Foundation

public struct GameListDefaults {

    public static let userDefaultsKey = "GameListDefaults"
    public static let userDefaults = UserDefaults.standard

    public static func save(_ value: RAWGGameListModel) {
        userDefaults.set(try? PropertyListEncoder().encode(value), forKey: userDefaultsKey)
    }

    public static func get() -> RAWGGameListModel {
        var gameList: RAWGGameListModel!
        if let data = userDefaults.value(forKey: userDefaultsKey) as? Data {
            gameList = try? PropertyListDecoder().decode(RAWGGameListModel.self, from: data)
            return gameList
        } else {
            return gameList
        }
    }

    public static func check() -> Bool {
        return userDefaults.object(forKey: userDefaultsKey) != nil
    }

    public static func delete() {
        userDefaults.removeObject(forKey: userDefaultsKey)
    }
}
