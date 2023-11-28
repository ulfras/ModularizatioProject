//
//  FavoriteGameRealm.swift
//
//
//  Created by Maulana Frasha on 28/11/23.
//

import RealmSwift

public struct FavoriteGameRealm {

    public static let realm = try! Realm()

    public static func save(_ value: [RAWGGameDetailModel]) {
        try! realm.write {
            realm.add(value.map(RealmRAWGGameDetailModel.init))
        }
    }

    public static func get() -> [RAWGGameDetailModel] {
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

    public static func check() -> Bool {
        return !realm.objects(RealmRAWGGameDetailModel.self).isEmpty
    }

    public static func delete() {
        try! realm.write {
            realm.delete(realm.objects(RealmRAWGGameDetailModel.self))
        }
    }
}
