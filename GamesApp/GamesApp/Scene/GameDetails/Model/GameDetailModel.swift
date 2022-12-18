//
//  GameDetailModel.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 6.12.2022.
//

import Foundation

// MARK: - Game Detail
struct GameDetail: Codable {
    var gameId: Int
    var name: String?
    var released: String?
    var backgroundImage: String?
    var rating: Double?
    var metacritic: Int?
    var suggestionsCount: Int?
    var reviewsCount: Int?
    var descriptionRaw: String?
    var parentPlatforms: [ParentPlatform]?
    var genres: [Genre]?
    var publishers: [Publisher]?
    enum CodingKeys: String, CodingKey {
        case gameId = "id"
        case name, released
        case backgroundImage = "background_image"
        case rating, metacritic
        case suggestionsCount = "suggestions_count"
        case reviewsCount = "reviews_count"
        case descriptionRaw = "description_raw"
        case parentPlatforms = "parent_platforms"
        case genres
        case publishers
    }
    
    var publishersString: String {
        guard let publishers = publishers else { return "No Publisher Info" }
        return publishers.map { $0.name }.joined(separator: ", ")
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
        guard let backgroundImage = backgroundImage else { return AssetExtractor.createLocalUrl(forImageNamed: "emptyImage")}
        return URL(string: backgroundImage)
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

// MARK: - Publisher
struct Publisher: Codable {
    var id: Int
    var name: String
}
