//
//  RealmRAWGGameDetailModel.swift
//
//
//  Created by Maulana Frasha on 28/11/23.
//

import RealmSwift

public class RealmRAWGGameDetailModel: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var released: String
    @Persisted var backgroundImage: String
    @Persisted var website: String
    @Persisted var rating: Double
    @Persisted var publishers: List<RealmPublisherName>
    @Persisted var developers: List<RealmGameDeveloper>
    @Persisted var esrbRating: RealmEsrbRating?
    @Persisted var descriptionRaw: String
    @Persisted var isFavorite: Bool?

    convenience init(from model: RAWGGameDetailModel) {
        self.init()
        id = model.id
        name = model.name
        released = model.released
        backgroundImage = model.backgroundImage
        website = model.website
        rating = model.rating
        publishers.append(objectsIn: model.publishers.map(RealmPublisherName.init))
        developers.append(objectsIn: model.developers.map(RealmGameDeveloper.init))
        esrbRating = RealmEsrbRating(from: model.esrbRating)
        descriptionRaw = model.descriptionRaw
        isFavorite = model.isFavorite
    }
}

public class RealmPublisherName: Object {
    @Persisted var name: String

    convenience init(from model: PublisherName) {
        self.init()
        name = model.name
    }
}

public class RealmGameDeveloper: Object {
    @Persisted var name: String

    convenience init(from model: GameDeveloper) {
        self.init()
        name = model.name
    }
}

public class RealmEsrbRating: Object {
    @Persisted var name: String

    convenience init(from model: EsrbRating) {
        self.init()
        name = model.name
    }
}
