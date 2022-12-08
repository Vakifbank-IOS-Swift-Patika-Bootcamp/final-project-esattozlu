//
//  GameDetailsViewModel.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 8.12.2022.
//

import Foundation

protocol GameDetailsViewModelProtocol {
    var delegate: GameDetailsViewModelDegelegate? { get set }
    func fetchGameDetail(id: Int)
    func getGameDetail() -> GameDetail?
}

protocol GameDetailsViewModelDegelegate: AnyObject {
    func gameDetailLoaded()
}

class GameDetailsViewModel: GameDetailsViewModelProtocol {
    weak var delegate: GameDetailsViewModelDegelegate?
    private var gameDetail: GameDetail?
    
    func fetchGameDetail(id: Int) {
        GameService.searchById(id: id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let gameDetail):
                DispatchQueue.main.async {
                    self.gameDetail = gameDetail
                    self.delegate?.gameDetailLoaded()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getGameDetail() -> GameDetail? {
        return gameDetail
    }
    
    
}
