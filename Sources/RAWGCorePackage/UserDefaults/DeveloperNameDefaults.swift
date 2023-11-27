//
//  DeveloperNameDefaults.swift
//  CatalogApp
//
//  Created by Maulana Frasha on 14/11/23.
//

import Foundation

public struct DeveloperNameDefaults {
    public static let devNameDefaultsKey = "DeveloperNameDefaults"
    public static let userDefaults = UserDefaults.standard

    public static func save(_ value: String) {
        userDefaults.set(value, forKey: devNameDefaultsKey)
    }

    public static func get() -> String {
        return userDefaults.string(forKey: devNameDefaultsKey)!
    }

    public static func check() -> Bool {
        return userDefaults.object(forKey: devNameDefaultsKey) != nil
    }
}
