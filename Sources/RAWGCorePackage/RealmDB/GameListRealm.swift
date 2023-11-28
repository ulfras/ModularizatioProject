//
//  GameListRealm.swift
//
//
//  Created by Maulana Frasha on 28/11/23.
//

import RealmSwift

public struct GameListRealm {

    public static let realm = try! Realm()

    public static func save(_ value: RAWGGameListModel) {
        try! realm.write {
            realm.add(RealmRAWGGameListModel(from: value))
        }
    }

    public static func get() -> RAWGGameListModel? {
        let realmResults = realm.objects(RealmRAWGGameListModel.self)
        
        guard let firstResult = realmResults.first else { return nil }
        
        let mappedResults: [RAWGGameListResult] = firstResult.results.map { realmResult in
            return RAWGGameListResult(
                id: realmResult.id,
                name: realmResult.name,
                released: realmResult.released,
                backgroundImage: realmResult.backgroundImage,
                rating: realmResult.rating
            )
        }
        
        return RAWGGameListModel(results: mappedResults)
    }

    public static func check() -> Bool {
        return !realm.objects(RealmRAWGGameListModel.self).isEmpty
    }

    public static func delete() {
        try! realm.write {
            realm.delete(realm.objects(RealmRAWGGameListModel.self))
        }
    }
}

