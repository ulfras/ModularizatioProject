//
//  RAWGModel.swift
//  CatalogApp
//
//  Created by Maulana Frasha on 09/11/23.
//

public struct RAWGGameListModel: Codable {
    let results: [RAWGGameListResult]
}

public struct RAWGGameListResult: Codable {
    let id: Int
    let name: String
    let released: String
    let backgroundImage: String
    let rating: Double

    enum CodingKeys: String, CodingKey {
        case id, name, released
        case backgroundImage = "background_image"
        case rating
    }
}
