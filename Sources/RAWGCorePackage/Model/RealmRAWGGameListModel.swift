//
//  RealmRAWGGameListModel.swift
//
//
//  Created by Maulana Frasha on 28/11/23.
//

import RealmSwift

public class RealmRAWGGameListResult: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var released: String
    @Persisted var backgroundImage: String
    @Persisted var rating: Double

    convenience init(from result: RAWGGameListResult) {
        self.init()
        id = result.id
        name = result.name
        released = result.released
        backgroundImage = result.backgroundImage
        rating = result.rating
    }
}
