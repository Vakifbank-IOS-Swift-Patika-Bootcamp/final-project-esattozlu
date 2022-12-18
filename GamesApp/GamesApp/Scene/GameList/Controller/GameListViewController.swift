//
//  GameListViewController.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 7.12.2022.
//

import UIKit

final class GameListViewController: BaseViewController {

    @IBOutlet private weak var gameListCollectionView: UICollectionView!
    private var viewModel: GameListViewModelProtocol = GameListViewModel()
    private var timer: Timer?
    private var page = 1
    private var filterTag = 0
    private var filterMenu: UIMenu {
        return UIMenu(title: "Filter".localized(), image: nil, identifier: nil, options: [], children: menuItems)
    }
    var menuItems: [UIAction] {
        configureMenuItems()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        configureCollectionView()
        showActivityIndicator()
        viewModel.fetchAllGames(page: 1)
        configureNavigationItem()
        configureGameSearchController()
        viewModel.sendNotification(title: "Welcome!", body: "We are so happy to see you here!", delegate: self)
    }
    
    // MARK: - Configures Menu Items
    func configureMenuItems() -> [UIAction] {
        return [
            UIAction(title: "All Games".localized(), image: UIImage(named: "all"), handler: { (_) in
                self.viewModel.paginationStarted = false
                self.gameListCollectionView.setContentOffset(.zero, animated: true)
                self.page = 1
                self.showActivityIndicator()
                self.viewModel.fetchAllGames(page: self.page)
                self.filterTag = 0
            }),
            UIAction(title: "Top Rated".localized(), image: UIImage(named: "ranking"), handler: { (_) in
                self.viewModel.paginationStarted = false
                self.gameListCollectionView.setContentOffset(.zero, animated: true)
                self.page = 1
                self.showActivityIndicator()
                self.viewModel.fetchTopRatedGames(page: self.page)
                self.filterTag = 1
            }),
            UIAction(title: "Newly Released".localized(), image: UIImage(named: "newly"), handler: { (_) in
                self.viewModel.paginationStarted = false
                self.gameListCollectionView.setContentOffset(.zero, animated: true)
                self.page = 1
                self.showActivityIndicator()
                self.viewModel.fetchNewlyReleasedGames(page: self.page)
                self.filterTag = 2
            })
        ]
    }
    
    func configureCollectionView() {
        gameListCollectionView.delegate    = self
        gameListCollectionView.dataSource  = self
        
        gameListCollectionView.register(UINib(nibName: "GameCollectionCell", bundle: nil), forCellWithReuseIdentifier: "gameCollectionCell")
    }
    
    func configureNavigationItem() {
        let barButtonItem = UIBarButtonItem(title: "Filter", image: UIImage(named: "filter"), primaryAction: nil, menu: filterMenu)
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = barButtonItem
    }
    
    func configureGameSearchController() {
        let gameSearchController = UISearchController(searchResultsController: nil)
        gameSearchController.searchBar.placeholder = "Type a game name to search.".localized()
        gameSearchController.searchBar.delegate = self
        navigationItem.searchController = gameSearchController
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? GameDetailsViewController else { return }
        guard let index = sender as? Int else { return }
        detailsVC.selectedGame = viewModel.getGames(at: index)
    }
}

// MARK: - CollectionView Extention
extension GameListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.gamesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gameCollectionCell", for: indexPath) as? GameCollectionCell,
              let model = viewModel.getGames(at: indexPath.row) else { return UICollectionViewCell() }
        cell.configureComponents(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toGameDetailsFromList", sender: indexPath.row)
    }
}

// MARK: - CollectionViewDelegateFlowLayout Extention
extension GameListViewController: UICollectionViewDelegateFlowLayout {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY >= contentHeight - height - 100 {
            viewModel.paginationStarted = true
            if filterTag == 0 {
                page += 1
                self.showActivityIndicator()
                self.viewModel.fetchAllGames(page: self.page)
            } else if filterTag == 1 {
                page += 1
                self.showActivityIndicator()
                self.viewModel.fetchTopRatedGames(page: self.page)
            } else if filterTag == 2 {
                page += 1
                self.showActivityIndicator()
                self.viewModel.fetchNewlyReleasedGames(page: self.page)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        viewModel.getSizeForItem(width: view.bounds.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 10, left: 20, bottom: 10, right: 20)
    }
    
}

// MARK: - SearchBar Extention
extension GameListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            self.showActivityIndicator()
            self.viewModel.fetchSearchedGames(query: searchText, page: 1)
        })
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if filterTag == 0 {
            page = 1
            self.showActivityIndicator()
            self.gameListCollectionView.setContentOffset(.zero, animated: true)
            self.viewModel.fetchAllGames(page: page)
        } else if filterTag == 1 {
            page = 1
            self.showActivityIndicator()
            self.gameListCollectionView.setContentOffset(.zero, animated: true)
            self.viewModel.fetchTopRatedGames(page: page)
        } else if filterTag == 2 {
            page = 1
            self.showActivityIndicator()
            self.gameListCollectionView.setContentOffset(.zero, animated: true)
            self.viewModel.fetchNewlyReleasedGames(page: page)
        }
    }
}

extension GameListViewController: GameListViewModelDelegate {
    func gamesLoaded() {
        gameListCollectionView.reloadData()
        stopActivityIndicator()
    }
}

// MARK: - LocalNotification Extention
extension GameListViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.list, .banner, .badge, .sound])
    }
}
