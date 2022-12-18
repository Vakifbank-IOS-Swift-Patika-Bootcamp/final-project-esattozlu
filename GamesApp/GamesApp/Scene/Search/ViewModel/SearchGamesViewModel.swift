//
//  SearchGamesViewModel.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 12.12.2022.
//

import Foundation

protocol SearchGamesViewModelProtocol {
    var delegate: SearchGamesViewModelDelegate? { get set }
    var paginationStarted: Bool { get set }
    func gamesCount() -> Int
    func getGames(at index: Int) -> Game?
    func fetchSearchedGames(query: String, page: Int)
    func clearGames()
}

protocol SearchGamesViewModelDelegate: AnyObject {
    func gamesLoaded()
}

final class SearchGamesViewModel: SearchGamesViewModelProtocol {
    weak var delegate: SearchGamesViewModelDelegate?
    var paginationStarted = false
    private var games: [Game]?
    
    func fetchSearchedGames(query: String, page: Int) {
        GameService.searchByName(page: page, query: query) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                guard let gamesFromResponse = response.games else { return }
                if self.paginationStarted {
                    self.games?.append(contentsOf: gamesFromResponse)
                } else {
                    self.games = gamesFromResponse
                }
                DispatchQueue.main.async {
                    self.delegate?.gamesLoaded()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func gamesCount() -> Int {
        games?.count ?? 0
    }
    
    func getGames(at index: Int) -> Game? {
        games?[index]
    }
    
    func clearGames() {
        self.games?.removeAll()
        self.delegate?.gamesLoaded()
    }
}
