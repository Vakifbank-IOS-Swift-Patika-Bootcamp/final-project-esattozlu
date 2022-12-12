//
//  SearchGamesViewModel.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 12.12.2022.
//

import Foundation

protocol SearchGamesViewModelProtocol {
    var delegate: SearchGamesViewModelDelegate? { get set }
    func gamesCount() -> Int
    func getGames(at index: Int) -> Game?
    func fetchSearchedGames(query: String, page: Int)
    func clearGames()
}

protocol SearchGamesViewModelDelegate {
    func gamesLoaded()
}

class SearchGamesViewModel: SearchGamesViewModelProtocol {
    var delegate: SearchGamesViewModelDelegate?
    private var games: [Game]?
    
    func fetchSearchedGames(query: String, page: Int) {
        GameService.searchByName(page: page, query: query) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.games = response.games
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
