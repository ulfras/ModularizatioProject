//
//  FavoriteGameDefaults.swift
//  CatalogApp
//
//  Created by Maulana Frasha on 14/11/23.
//

import Foundation

public struct FavoriteGameDefaults {

    public static let userDefaultsKey = "FavoriteGameDefaults"
    public static let userDefaults = UserDefaults.standard

    public static func save(_ value: [RAWGGameDetailModel]) {
        userDefaults.set(try? PropertyListEncoder().encode(value), forKey: userDefaultsKey)
    }

    public static func get() -> [RAWGGameDetailModel] {
        var favoriteGameList: [RAWGGameDetailModel]!
        if let data = userDefaults.value(forKey: userDefaultsKey) as? Data {
            favoriteGameList = try? PropertyListDecoder().decode([RAWGGameDetailModel].self, from: data)
            return favoriteGameList
        } else {
            return favoriteGameList
        }
    }

    public static func check() -> Bool {
        return userDefaults.object(forKey: userDefaultsKey) != nil
    }

    public static func delete() {
        userDefaults.removeObject(forKey: userDefaultsKey)
    }
}
