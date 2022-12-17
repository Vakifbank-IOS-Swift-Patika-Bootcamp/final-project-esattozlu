//
//  GameDetailsViewModelTest.swift
//  GamesAppTests
//
//  Created by Hasan Esat Tozlu on 17.12.2022.
//

import XCTest
@testable import GamesApp

final class GameDetailsViewModelTest: XCTestCase {
    
    
    var viewModel: GameDetailsViewModel!
    var fetchExpectation: XCTestExpectation!
    
    override func setUpWithError() throws {
        viewModel = GameDetailsViewModel()
        viewModel.gameDetailsViewModelDelegate = self
    }

    func testFetchGameDetails() throws {
        fetchExpectation = expectation(description: "fetchGames")
        //Given
        XCTAssertNil(viewModel.getGameDetail())
        //When
        viewModel.fetchGameDetail(id: 3498)
        waitForExpectations(timeout: 10)
        //Then
        XCTAssertEqual(viewModel.getGameDetail()?.name, "Grand Theft Auto V")
    }
}

extension GameDetailsViewModelTest: GameDetailsViewModelDelegate {
    func gameDetailLoaded() {
        fetchExpectation.fulfill()
    }
}
