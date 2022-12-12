//
//  GameListViewController.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 7.12.2022.
//

import UIKit

class GameListViewController: BaseViewController {

    @IBOutlet weak var gameListCollectionView: UICollectionView!
    private var viewModel: GameListViewModelProtocol = GameListViewModel()
    var timer: Timer?
    var filterMenu: UIMenu {
        return UIMenu(title: "Filter", image: nil, identifier: nil, options: [], children: menuItems)
    }
    var menuItems: [UIAction] {
        return [
            UIAction(title: "All Games", image: UIImage(named: "all"), handler: { (_) in
                self.showActivityIndicator()
                self.viewModel.fetchAllGames(page: 1)
            }),
            UIAction(title: "Top Rated", image: UIImage(named: "ranking"), handler: { (_) in
                self.showActivityIndicator()
                self.viewModel.fetchTopRatedGames(page: 1)
            }),
            UIAction(title: "Newly Released", image: UIImage(named: "newly"), handler: { (_) in
                self.showActivityIndicator()
                self.viewModel.fetchNewlyReleasedGames(page: 1)
            })
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        configureCollectionView()
        showActivityIndicator()
        viewModel.fetchAllGames(page: 1)
        configureNavigationItem()
        configureGameSearchController()
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
        gameSearchController.searchBar.placeholder = "Type an employee name to search."
        gameSearchController.searchBar.delegate = self
        navigationItem.searchController = gameSearchController
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? GameDetailsViewController else { return }
        guard let index = sender as? Int else { return }
        detailsVC.selectedGame = viewModel.getGames(at: index)
    }
}

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

extension GameListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        viewModel.getSizeForItem(width: view.bounds.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 10, left: 20, bottom: 10, right: 20)
    }
    
}

extension GameListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            self.showActivityIndicator()
            self.viewModel.fetchSearchedGames(query: searchText, page: 1)
        })
    }
}

extension GameListViewController: GameListViewModelDelegate {
    func gamesLoaded() {
        gameListCollectionView.reloadData()
        stopActivityIndicator()
    }
}
