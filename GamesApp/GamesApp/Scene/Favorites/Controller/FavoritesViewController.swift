//
//  FavoritesViewController.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 6.12.2022.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var favoritesCollectionView: UICollectionView!
    private var viewModel: FavoritesViewModelProtocol = FavoritesViewModel()
    var favoriteGames: [FavoritesCoreData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var config = UICollectionLayoutListConfiguration(appearance: .plain)
        config.trailingSwipeActionsConfigurationProvider = { indexPath in
            let del = UIContextualAction(style: .destructive, title: "Delete") {
                [weak self] action, view, completion in
                self?.delete(at: indexPath)
                completion(true)
            }
            return UISwipeActionsConfiguration(actions: [del])
        }
        
        viewModel.delegate = self
        fetchGamesFromCoreData()
        configureCollectionView()
    }
    
    func delete(at: IndexPath) {
        
    }
    @objc func fetchGamesFromCoreData() {
        favoriteGames = viewModel.fetchGames()
        DispatchQueue.main.async {
            self.favoritesCollectionView.reloadData()
        }
    }
    
    
    func configureCollectionView() {
        favoritesCollectionView.dataSource = self
        favoritesCollectionView.delegate = self
        favoritesCollectionView.alwaysBounceVertical = true
        
        favoritesCollectionView.register(UINib(nibName: "SmallGamesCollectionCell", bundle: nil), forCellWithReuseIdentifier: "smallGamesCollectionCell")
        NotificationCenter.default.addObserver(self, selector: #selector(fetchGamesFromCoreData), name: NSNotification.Name(rawValue: "FavoritesChanged"), object: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let favoriteDetailVC = segue.destination as?  FavoriteDetailsViewController,
              let index = sender as? Int,
              let favoriteGames = favoriteGames
        else { return }
        favoriteDetailVC.favorite = favoriteGames[index]
        
    }
}

extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteGames?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "smallGamesCollectionCell", for: indexPath) as? SmallGamesCollectionCell,
              let favoriteGames = favoriteGames
        else { return UICollectionViewCell() }
        cell.game = favoriteGames[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.getSizeForItem(width: view.bounds.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toFavoriteDetail", sender: indexPath.row)
    }
    
}

extension FavoritesViewController: FavoritesViewModelDelegate {
    func favoritesChanged() {
        fetchGamesFromCoreData()
    }
}
