//
//  FavoriteDetailsViewController.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 10.12.2022.
//

import UIKit

final class FavoriteDetailsViewController: UIViewController {

    @IBOutlet private weak var gameImageView: UIImageView!
    @IBOutlet private weak var gameNameLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var raitingLabel: UILabel!
    @IBOutlet private weak var metacriticLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!
    @IBOutlet private weak var raitingBelowLabel: UILabel!
    @IBOutlet private weak var suggestionLabel: UILabel!
    @IBOutlet private weak var reviewsLabel: UILabel!
    @IBOutlet private weak var removeFromFavorites: UIButton!
    var favorite: FavoritesCoreData?
    var viewModel: FavoriteDetailViewModelProtocol = FavoriteDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureComponents()
        viewModel.delegate = self
    }
    
    func configureComponents() {
        guard let favorite = favorite else { return }
        if let url = favorite.gameImage {
            gameImageView.sd_setImage(with: URL(string: url))
        } else {
            gameImageView.sd_setImage(with: AssetExtractor.createLocalUrl(forImageNamed: "emptyImage"))
        }
        gameNameLabel.text = favorite.gameName
        releaseDateLabel.text = favorite.gameReleased
        raitingLabel.text = favorite.raiting
        metacriticLabel.text = favorite.metacritic
        genreLabel.text = favorite.genres
        raitingBelowLabel.text = favorite.raiting
        suggestionLabel.text = String.localizedWithParameter(string: "%@ suggestions", parameter: favorite.suggestions ?? "0")
        reviewsLabel.text = String.localizedWithParameter(string: "%@ reviews", parameter: favorite.reviews ?? "0")
    }
    
    @IBAction func removeFromFavoritesButtonClicked(_ sender: Any) {
        guard let favorite = favorite else { return }
        viewModel.removeGameFromFavorites(id: favorite.gameId)
    }
}

extension FavoriteDetailsViewController: FavoriteDetailViewModelDelegate {
    func taskCompleted() {
        self.dismiss(animated: true)
    }
}
