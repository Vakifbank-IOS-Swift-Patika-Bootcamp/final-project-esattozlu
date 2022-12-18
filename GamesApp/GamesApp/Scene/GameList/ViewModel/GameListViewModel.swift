//
//  GameListViewModel.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 7.12.2022.
//

import Foundation
import UserNotifications

protocol GameListViewModelProtocol: AnyObject {
    var delegate: GameListViewModelDelegate? { get set }
    var paginationStarted: Bool { get set }
    var notificationManager: LocalNotificationProtocol { get set }
    func fetchTopRatedGames(page: Int)
    func fetchNewlyReleasedGames(page: Int)
    func fetchAllGames(page: Int)
    func fetchSearchedGames(query: String, page: Int)
    func sendNotification(title: String, body: String, delegate: UNUserNotificationCenterDelegate)
    func gamesCount() -> Int
    func getGames(at index: Int) -> Game?
    func getSizeForItem(width: CGFloat) -> CGSize
}

protocol GameListViewModelDelegate: AnyObject {
    func gamesLoaded()
}

final class GameListViewModel: GameListViewModelProtocol {
    var notificationManager: LocalNotificationProtocol
    weak var delegate: GameListViewModelDelegate?
    var paginationStarted = false
    private var games: [Game]?
    
    init() {
        self.notificationManager = LocalNotificationManager.shared
    }
    
    func sendNotification(title: String, body: String, delegate: UNUserNotificationCenterDelegate) {
        let title = title.localized()
        let body = body.localized()
        notificationManager.userNotificationCenter.delegate = delegate
        notificationManager.sendNotification(title: title, body: body)
    }
    
    func fetchTopRatedGames(page: Int) {
        GameService.topRated(page: page) { [weak self] result in
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
    
    func fetchAllGames(page: Int) {
        GameService.allGames(page: page) { [weak self] result in
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
    
    func getSizeForItem(width: CGFloat) -> CGSize {
        let padding: CGFloat            = 20
        let itemWidth                   = width - (padding*2)
        return .init(width: itemWidth, height: itemWidth)
    }
}
