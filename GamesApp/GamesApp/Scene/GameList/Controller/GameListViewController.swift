//
//  GameListViewController.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 7.12.2022.
//

import UIKit

class GameListViewController: UIViewController {

    @IBOutlet weak var gameListCollectionView: UICollectionView!
    private var viewModel: GameListViewModelProtocol = GameListViewModel()
    var filterMenu: UIMenu {
        return UIMenu(title: "Filter", image: nil, identifier: nil, options: [], children: menuItems)
    }
    var menuItems: [UIAction] {
        return [
            UIAction(title: "All Games", image: UIImage(named: "all"), handler: { (_) in
                self.viewModel.fetchAllGames(page: 1)
            }),
            UIAction(title: "Top Rated", image: UIImage(named: "ranking"), handler: { (_) in
                self.viewModel.fetchTopRatedGames(page: 1)
            }),
            UIAction(title: "Newly Released", image: UIImage(named: "newly"), handler: { (_) in
                self.viewModel.fetchNewlyReleasedGames(page: 1)
            })
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        gameListCollectionView.delegate    = self
        gameListCollectionView.dataSource  = self
        
        gameListCollectionView.register(UINib(nibName: "GameCollectionCell", bundle: nil), forCellWithReuseIdentifier: "gameCollectionCell")
        viewModel.fetchAllGames(page: 1)
        configureNavigationItem()
    }
    
    func configureNavigationItem() {
        let barButtonItem = UIBarButtonItem(title: "Filter", image: UIImage(named: "filter"), primaryAction: nil, menu: filterMenu)
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = barButtonItem
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
}

extension GameListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        viewModel.getSizeForItem(width: view.bounds.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}

extension GameListViewController: GameListViewModelDelegate {
    func gamesLoaded() {
        gameListCollectionView.reloadData()
    }
}
