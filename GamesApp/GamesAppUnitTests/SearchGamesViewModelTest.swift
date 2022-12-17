//
//  SearchGamesViewModelTest.swift
//  GamesAppTests
//
//  Created by Hasan Esat Tozlu on 17.12.2022.
//

import XCTest
@testable import GamesApp

final class SearchGamesViewModelTest: XCTestCase {

    var viewModel: SearchGamesViewModel!
    var fetchExpectation: XCTestExpectation!
    
    override func setUpWithError() throws {
       viewModel = SearchGamesViewModel()
        viewModel.delegate = self
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
        XCTAssertEqual(viewModel.gamesCount(), 20)
    }
}

extension SearchGamesViewModelTest: SearchGamesViewModelDelegate {
    func gamesLoaded() {
        fetchExpectation.fulfill()
    }
}
