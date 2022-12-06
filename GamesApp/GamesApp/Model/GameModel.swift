//
//  GameModel.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 6.12.2022.
//

import Foundation

// MARK: - Game
struct Game: Codable {
    var gameId: Int
    var name: String?
    var released: Date?
    var backgroundImage: String?
    var rating: Double?
    var metacritic: Int?
    var suggestionsCount: Int?
    var reviewsCount: Int?
    var parentPlatforms: [ParentPlatform]?
    var genres: [Genre]?
    var shortScreenshots: [ShortScreenshot]?
    
    enum CodingKeys: String, CodingKey {
        case gameId = "id"
        case name, released
        case backgroundImage = "background_image"
        case rating, metacritic
        case suggestionsCount = "suggestions_count"
        case reviewsCount = "reviews_count"
        case parentPlatforms = "parent_platforms"
        case genres
        case shortScreenshots = "short_screenshots"
    }
    
    var releaseFormattedDate: String {
        guard let released = released else { return "" }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter.string(from: released)
    }

    var ratingString: String {
        if let rating = rating {
            return String(format: "%.1f", round(rating))
        } else {
            return "0"
        }
    }
    
    var backgroundUrl: URL {
        return URL(string: backgroundImage ?? "")!
    }

    var genreText: String? {
        guard let genres = genres else { return "" }

        return genres.map { $0.name }.joined(separator: ", ")
    }
}

// MARK: - Game Detail
struct GameDetail: Codable {
    var descriptionRaw: String?
    
    enum CodingKeys: String, CodingKey {
        case descriptionRaw = "description_raw"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

// MARK: - ParentPlatform
struct ParentPlatform: Codable {
    let id: Int
    let name, slug: String
}

// MARK: - ShortScreenshot
struct ShortScreenshot: Codable {
    let id: Int
    let image: String
    
    var screenshotUrl: URL {
        return URL(string: image)!
    }
}
