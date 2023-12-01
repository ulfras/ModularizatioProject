//
//  GameListRealm.swift
//
//
//  Created by Maulana Frasha on 28/11/23.
//

import RealmSwift

public protocol GameListRealmDataSource {
    
    func save(_ value: RAWGGameListModel)
    
    func get() -> RAWGGameListModel?
    
    func check() -> Bool
    
    func delete()
}

public class GameListRealm: GameListRealmDataSource {
    
    public let realm = try! Realm()
    
    public init() { }

    public func save(_ value: RAWGGameListModel) {
        try! realm.write {
            realm.add(RealmRAWGGameListModel(from: value))
        }
    }

    public func get() -> RAWGGameListModel? {
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

    public func check() -> Bool {
        return !realm.objects(RealmRAWGGameListModel.self).isEmpty
    }

    public func delete() {
        try! realm.write {
            realm.delete(realm.objects(RealmRAWGGameListModel.self))
        }
    }
}
