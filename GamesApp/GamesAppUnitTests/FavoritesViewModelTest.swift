//
//  FavoritesViewModelTest.swift
//  GamesAppTests
//
//  Created by Hasan Esat Tozlu on 17.12.2022.
//

import XCTest
@testable import GamesApp

final class FavoritesViewModelTest: XCTestCase {

    var favoritesViewModel: FavoritesViewModel!
    var favoriteDetailViewModel: FavoriteDetailViewModel!
    var gameDetailsViewModel: GameDetailsViewModel!
    
    let mockGame1 = Game(gameId: 1, name: "name", released: "released", backgroundImage: "backgroundImage", rating: 5.0, metacritic: 100, suggestionsCount: 100, reviewsCount: 100, parentPlatforms: [ParentPlatform(platform: Platform(id: 1, name: "Platform"))], genres: [Genre(id: 1, name: "Genre")], shortScreenshots: [ShortScreenshot(id: 1, image: "ShortScreenshot")])
    let mockGame2 = Game(gameId: 2, name: "name2", released: "released2", backgroundImage: "backgroundImage2", rating: 5.0, metacritic: 100, suggestionsCount: 100, reviewsCount: 100, parentPlatforms: [ParentPlatform(platform: Platform(id: 2, name: "Platform2"))], genres: [Genre(id: 2, name: "Genre2")], shortScreenshots: [ShortScreenshot(id: 2, image: "ShortScreenshot2")])
    
    override func setUpWithError() throws {
        favoritesViewModel = FavoritesViewModel()
        favoriteDetailViewModel = FavoriteDetailViewModel()
        gameDetailsViewModel = GameDetailsViewModel()
    }
    
    
    func testFavoritesCoreData() throws {
        let count = favoritesViewModel.fetchGames()?.count
        gameDetailsViewModel.saveGameToCoreData(game: mockGame1) {}
        XCTAssertEqual(favoritesViewModel.fetchGames()?.count, count! + 1)
        gameDetailsViewModel.removeGameFromCoreData(id: 1) {}
        XCTAssertEqual(favoritesViewModel.fetchGames()?.count, count!)
        gameDetailsViewModel.saveGameToCoreData(game: mockGame2) {}
        XCTAssertEqual(favoritesViewModel.fetchGames()?.count, count! + 1)
        favoriteDetailViewModel.removeGameFromFavorites(id: 2)
        XCTAssertEqual(favoritesViewModel.fetchGames()?.count, count!)
    }
    

    func testGetSizeForItem() throws {
        XCTAssertEqual(favoritesViewModel.getSizeForItem(width: 100), CGSize(width: 60, height: 60/2.3))
    }
}
