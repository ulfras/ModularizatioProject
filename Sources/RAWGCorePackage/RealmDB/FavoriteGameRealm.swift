//
//  FavoriteGameRealm.swift
//
//
//  Created by Maulana Frasha on 28/11/23.
//

import RealmSwift

public protocol FavoriteGameRealmDataSource {
    
    func save(_ gameDetailModel: RAWGGameDetailModel)
    
    func get() -> [RAWGGameDetailModel]
    
    func check() -> Bool
    
    func delete()
}


public class FavoriteGameRealm: FavoriteGameRealmDataSource {
    
    public let realm = try! Realm()
    
    public init() { }
    
    public func save(_ gameDetailModel: RAWGGameDetailModel) {
        try! realm.write {
            if gameDetailModel.isFavorite ?? false {
                realm.add(RealmRAWGGameDetailModel(from: gameDetailModel), update: .modified)
            } else {
                if let existingGame = realm.object(ofType: RealmRAWGGameDetailModel.self, forPrimaryKey: gameDetailModel.id) {
                    realm.delete(existingGame)
                }
            }
        }
    }

    public func get() -> [RAWGGameDetailModel] {
        let realmResults = realm.objects(RealmRAWGGameDetailModel.self)
        
        let mappedResults: [RAWGGameDetailModel] = realmResults.compactMap { realmResult in
            guard let esrbRating = realmResult.esrbRating else {
                // Handle the case where esrbRating is nil
                return nil
            }

            return RAWGGameDetailModel(
                id: realmResult.id,
                name: realmResult.name,
                released: realmResult.released,
                backgroundImage: realmResult.backgroundImage,
                website: realmResult.website,
                rating: realmResult.rating,
                publishers: realmResult.publishers.map { RealmPublisherName in
                    return PublisherName(name: RealmPublisherName.name)
                },
                developers: realmResult.developers.map { RealmGameDeveloper in
                    return GameDeveloper(name: RealmGameDeveloper.name)
                },
                esrbRating: EsrbRating(name: esrbRating.name),
                descriptionRaw: realmResult.descriptionRaw,
                isFavorite: realmResult.isFavorite
            )
        }
        
        return mappedResults
    }

    public func check() -> Bool {
        return !realm.objects(RealmRAWGGameDetailModel.self).isEmpty
    }

    public func delete() {
        try! realm.write {
            realm.delete(realm.objects(RealmRAWGGameDetailModel.self))
        }
    }
}
