//
//  FavoriteDetailsViewController.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 10.12.2022.
//

import UIKit

class FavoriteDetailsViewController: UIViewController {

    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var raitingLabel: UILabel!
    @IBOutlet weak var metacriticLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var raitingBelowLabel: UILabel!
    @IBOutlet weak var suggestionLabel: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var removeFromFavorites: UIButton!
    var favorite: FavoritesCoreData?
    var viewModel: FavoriteDetailViewModelProtocol = FavoriteDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureComponents()
        viewModel.delegate = self
    }
    
    func configureComponents() {
        guard let favorite = favorite,
              let imageUrlString = favorite.gameImage
        else { return }
        gameImageView.sd_setImage(with: URL(string: imageUrlString))
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
