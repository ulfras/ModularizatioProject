//
//  RAWGModel.swift
//  CatalogApp
//
//  Created by Maulana Frasha on 09/11/23.
//

public struct RAWGGameListModel: Codable {
    public let results: [RAWGGameListResult]
}

public struct RAWGGameListResult: Codable {
    public let id: Int
    public let name: String
    public let released: String
    public let backgroundImage: String
    public let rating: Double

    enum CodingKeys: String, CodingKey {
        case id, name, released
        case backgroundImage = "background_image"
        case rating
    }
}
