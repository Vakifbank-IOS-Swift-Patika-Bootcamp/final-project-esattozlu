//
//  GamesResponseModel.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 6.12.2022.
//

import Foundation

// MARK: - Game Response
struct GamesResponse: Codable {
    var games: [Game]?

    enum CodingKeys: String, CodingKey {
        case games = "results"
    }
}
