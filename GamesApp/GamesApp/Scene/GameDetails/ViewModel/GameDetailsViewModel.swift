//
//  GameDetailsViewModel.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 8.12.2022.
//

import Foundation

protocol GameDetailsViewModelProtocol {
    var gameDetailsViewModelDelegate: GameDetailsViewModelDelegate? { get set }
    func fetchGameDetail(id: Int)
    func getGameDetail() -> GameDetail?
    func saveGameToCoreData(game: Game, completion: () -> Void)
    func removeGameFromCoreData(id: Int, completion: () -> Void)
}

protocol GameDetailsViewModelDelegate: AnyObject {
    func gameDetailLoaded()
}

protocol GameDetailsCoreDataDelegate: AnyObject {
    func gameFavoriteStatusChanged()
}

final class GameDetailsViewModel: GameDetailsViewModelProtocol {
    weak var gameDetailsViewModelDelegate: GameDetailsViewModelDelegate?
    private var gameDetail: GameDetail?
    
    func fetchGameDetail(id: Int) {
        GameService.searchById(id: id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let gameDetail):
                DispatchQueue.main.async {
                    self.gameDetail = gameDetail
                    self.gameDetailsViewModelDelegate?.gameDetailLoaded()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getGameDetail() -> GameDetail? {
        return gameDetail
    }
    
    func saveGameToCoreData(game: Game, completion: () -> Void) {
        CoreDataManager.shared.saveToFavorites(game: game) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "FavoritesChanged"), object: nil)
            completion()
        }
    }
    
    func removeGameFromCoreData(id: Int, completion: () -> Void) {
        CoreDataManager.shared.removeFromFavorites(id: id) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "FavoritesChanged"), object: nil)
            completion()
        }
    }
}
