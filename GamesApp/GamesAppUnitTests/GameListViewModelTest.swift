//
//  GameListViewModelTest.swift
//  GamesAppTests
//
//  Created by Hasan Esat Tozlu on 17.12.2022.
//

import XCTest
@testable import GamesApp

final class GameListViewModelTest: XCTestCase {

    var viewModel: GameListViewModel!
    var fetchExpectation: XCTestExpectation!
    
    override func setUpWithError() throws {
        viewModel = GameListViewModel()
        viewModel.delegate = self
    }

    func testFetchAllGames() throws {
        fetchExpectation = expectation(description: "fetchGames")
        //Given
        XCTAssertEqual(viewModel.gamesCount(), 0)
        //When
        viewModel.fetchAllGames(page: 1)
        waitForExpectations(timeout: 10)
        //Then
        XCTAssertEqual(viewModel.gamesCount(), 20)
    }
    
    func testFetchNewlyReleased() throws {
        fetchExpectation = expectation(description: "fetchGames")
        //Given
        XCTAssertEqual(viewModel.gamesCount(), 0)
        //When
        viewModel.fetchNewlyReleasedGames(page: 1)
        waitForExpectations(timeout: 10)
        //Then
        XCTAssertEqual(viewModel.gamesCount(), 20)
    }
    
    func testFetchTopRated() throws {
        fetchExpectation = expectation(description: "fetchGames")
        //Given
        XCTAssertEqual(viewModel.gamesCount(), 0)
        //When
        viewModel.fetchTopRatedGames(page: 1)
        waitForExpectations(timeout: 10)
        //Then
        XCTAssertEqual(viewModel.gamesCount(), 20)
    }
    
    func testFetchSearchedGames() throws {
        fetchExpectation = expectation(description: "fetchGames")
        //Given
        XCTAssertNil(viewModel.getGames(at: 0))
        //When
        viewModel.fetchSearchedGames(query: "Grand Theft Auto V", page: 1)
        waitForExpectations(timeout: 10)
        //Then
        XCTAssertEqual(viewModel.getGames(at: 0)?.name, "Grand Theft Auto V")
    }
    
    func testSizeForItem() throws {
        XCTAssertEqual(viewModel.getSizeForItem(width: 100), CGSize(width: 60, height: 60))
    }
}

extension GameListViewModelTest: GameListViewModelDelegate {
    func gamesLoaded() {
        fetchExpectation.fulfill()
    }
}
