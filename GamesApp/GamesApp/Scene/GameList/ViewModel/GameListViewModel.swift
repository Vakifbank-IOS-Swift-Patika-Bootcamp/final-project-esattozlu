//
//  GameListViewModel.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 7.12.2022.
//

import Foundation

protocol GameListViewModelProtocol {
    var delegate: GameListViewModelDelegate? { get set }
    func fetchTopRatedGames(page: Int)
    func fetchNewlyReleasedGames(page: Int)
    func fetchAllGames(page: Int)
    func gamesCount() -> Int
    func getGames(at index: Int) -> Game?
    func getSizeForItem(width: CGFloat) -> CGSize
}

protocol GameListViewModelDelegate: AnyObject {
    func gamesLoaded()
}

final class GameListViewModel: GameListViewModelProtocol {
    var delegate: GameListViewModelDelegate?
    private var games: [Game]?
    
    func fetchTopRatedGames(page: Int) {
        GameService.topRated(page: page) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.games = response.games
                DispatchQueue.main.async {
                    self.delegate?.gamesLoaded()
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchNewlyReleasedGames(page: Int) {
        GameService.newRelease(page: page) { [weak self] result in
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
    
    func fetchAllGames(page: Int) {
        GameService.allGames(page: page) { [weak self] result in
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
    
    func getSizeForItem(width: CGFloat) -> CGSize {
        let padding: CGFloat            = 12
        let itemWidth                   = width - (padding*2)
        return .init(width: itemWidth, height: itemWidth)
    }
    
}
