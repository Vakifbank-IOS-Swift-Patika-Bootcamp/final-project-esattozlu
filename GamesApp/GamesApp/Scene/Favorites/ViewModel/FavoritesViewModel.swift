//
//  FavoritesViewModel.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 9.12.2022.
//

import Foundation

protocol FavoritesViewModelProtocol {
    var delegate: FavoritesViewModelDelegate? { get set }
    func fetchGames() -> [FavoritesCoreData]?
    func getSizeForItem(width: CGFloat) -> CGSize
}

protocol FavoritesViewModelDelegate: AnyObject {
    func favoritesChanged()
}

final class FavoritesViewModel: FavoritesViewModelProtocol {
    weak var delegate: FavoritesViewModelDelegate?
    var favoriteGames: [FavoritesCoreData]?
    
    func fetchGames() -> [FavoritesCoreData]? {
        favoriteGames = CoreDataManager.shared.getGames{}
        
        return favoriteGames
    }
    
    func getSizeForItem(width: CGFloat) -> CGSize {
        let padding: CGFloat            = 20
        let itemWidth                   = width - (padding*2)
        return .init(width: itemWidth, height: itemWidth/2.3)
    }
}
