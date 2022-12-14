//
//  FavoriteDetailViewModel.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 12.12.2022.
//

import Foundation

protocol FavoriteDetailViewModelProtocol {
    var delegate: FavoriteDetailViewModelDelegate? { get set }
    func removeGameFromFavorites(id: Int32)
}

protocol FavoriteDetailViewModelDelegate: AnyObject {
    func taskCompleted()
}

final class FavoriteDetailViewModel: FavoriteDetailViewModelProtocol {
    weak var delegate: FavoriteDetailViewModelDelegate?
    
    func removeGameFromFavorites(id: Int32) {
        let id = Int(id)
        CoreDataManager.shared.removeFromFavorites(id: id) {
            delegate?.taskCompleted()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "FavoritesChanged"), object: nil)
        }
    }
}
