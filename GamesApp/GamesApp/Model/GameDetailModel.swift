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
    
    enum CodingKeys: String, CodingKey {
        case descriptionRaw = "description_raw"
    }
}
