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
    var released: String?
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
        formatter.dateFormat = "yyyy-MM-dd"
        guard let releaseDate = formatter.date(from: released) else { return "" }
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter.string(from: releaseDate)
    }

    var ratingString: String {
        if let rating = rating {
            return String(format: "%.1f", rating)
        } else {
            return "0"
        }
    }
    
    var metacriticString: String {
        if let metacritic = metacritic {
            return String(metacritic)
        } else {
            return "0"
        }
    }
    
    var suggestionCountString: String {
        if let suggestionsCount = suggestionsCount {
            return String(suggestionsCount)
        } else {
            return "0"
        }
    }
    
    var reviewsCountString: String {
        if let reviewsCount = reviewsCount {
            return String(reviewsCount)
        } else {
            return "0"
        }
    }
    
    var backgroundUrl: URL? {
        if let backgroundImage = backgroundImage {
            return URL(string: backgroundImage)
        } else {
            return AssetExtractor.createLocalUrl(forImageNamed: "emptyImage")
        }
    }

    var genreText: String? {
        guard let genres = genres else { return "" }

        return genres.map { $0.name }.joined(separator: ", ")
    }
    
    var parentPlatformText: String? {
        guard let parentPlatforms = parentPlatforms else { return "" }
        
        return parentPlatforms.map { $0.platform.name }.joined(separator: ", ")
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

// MARK: - ParentPlatform
struct ParentPlatform: Codable {
    let platform: Platform
}

// MARK: - Platform
struct Platform: Codable {
    let id: Int
    let name: String
}

// MARK: - ShortScreenshot
struct ShortScreenshot: Codable {
    let id: Int
    let image: String?
    
    var screenshotUrl: URL? {
        if let image = image {
            return URL(string: image)
        } else {
            return AssetExtractor.createLocalUrl(forImageNamed: "emptyImage")
        }
    }
}
