//
//  GameDetailModel.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 6.12.2022.
//

import Foundation

// MARK: - Game Detail
struct GameDetail: Codable {
    var descriptionRaw: String?
    var publishers: [Publisher]?
    enum CodingKeys: String, CodingKey {
        case descriptionRaw = "description_raw"
        case publishers
    }
    
    var publishersString: String {
        guard let publishers = publishers else { return "No Publisher Info" }
        return publishers.map { $0.name }.joined(separator: ", ")
    }
}

// MARK: - Publisher
struct Publisher: Codable {
    var id: Int
    var name: String
}
