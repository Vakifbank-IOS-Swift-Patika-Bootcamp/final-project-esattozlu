//
//  GameDetailsView.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 8.12.2022.
//

import UIKit

final class GameDetailsView: UIView {
    
    @IBOutlet private weak var gameImageView: UIImageView!
    @IBOutlet private weak var addToFavButton: UIButton!
    @IBOutlet private weak var addedToFavButton: UIButton!
    @IBOutlet private weak var gameNameLabel: UILabel!
    @IBOutlet private weak var releasedLabel: UILabel!
    @IBOutlet private weak var raitingLabel: UILabel!
    @IBOutlet private weak var raitingBelowLabel: UILabel!
    @IBOutlet private weak var metacriticsLabel: UILabel!
    @IBOutlet private weak var gameDescriptionLabel: UILabel!
    @IBOutlet private weak var genresLabel: UILabel!
    @IBOutlet private weak var screenshotsCollectionView: UICollectionView!
    @IBOutlet private weak var suggestionLabel: UILabel!
    @IBOutlet private weak var reviewsLabel: UILabel!
    @IBOutlet private weak var publishersLabel: UILabel!
    var selectedGame: Game?
    var viewModel: GameDetailsViewModelProtocol = GameDetailsViewModel()
    var gameDetail: GameDetail? {
        didSet {
            DispatchQueue.main.async {
                self.configureLabels()
                self.configureCollectionView()
                self.configureFavoriteButton()
            }
        }
    }
    var isFavorited = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customInit() {
        let nib = UINib(nibName: "GameDetailsView", bundle: nil)
        if let view = nib.instantiate(withOwner: self).first as? UIView {
            addSubview(view)
            view.frame = self.bounds
        }
    }
    
    private func configureFavoriteButton() {
        if isFavorited {
            addedToFavButton.isHidden = false
            addToFavButton.isHidden = true
        } else {
            addedToFavButton.isHidden = true
            addToFavButton.isHidden = false
        }
    }
    
    private func configureLabels() {
        guard let gameDetail = gameDetail else { return }
        gameImageView.sd_setImage(with: gameDetail.backgroundUrl)
        releasedLabel.text          = gameDetail.releaseFormattedDate
        raitingLabel.text           = gameDetail.ratingString
        raitingBelowLabel.text      = gameDetail.ratingString
        gameNameLabel.text          = gameDetail.name
        metacriticsLabel.text       = gameDetail.metacriticString
        genresLabel.text            = gameDetail.genreText
        suggestionLabel.text        = String.localizedWithParameter(string: "%@ suggestions", parameter: gameDetail.suggestionCountString)
        reviewsLabel.text           = String.localizedWithParameter(string: "%@ reviews", parameter: gameDetail.reviewsCountString)

        publishersLabel.text        = gameDetail.publishersString
        gameDescriptionLabel.text   = gameDetail.descriptionRaw
    }
    
    private func configureCollectionView() {
        screenshotsCollectionView.delegate = self
        screenshotsCollectionView.dataSource = self
        screenshotsCollectionView.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        screenshotsCollectionView.register(UINib(nibName: "ScreenshotsCollectionCell", bundle: nil), forCellWithReuseIdentifier: "screenshotsCollectionCell")
    }
    
    @IBAction func addToFavoritesButtonClicked(_ sender: Any) {
        guard let selectedGame = selectedGame else { return }
        viewModel.saveGameToCoreData(game: selectedGame) {
            addedToFavButton.isHidden = false
            addToFavButton.isHidden = true
        }
    }
    
    @IBAction func addedToFavoritesButtonClicked(_ sender: Any) {
        guard let selectedGame = selectedGame else { return }
        viewModel.removeGameFromCoreData(id: selectedGame.gameId) {
            addedToFavButton.isHidden = true
            addToFavButton.isHidden = false
        }
    }
}

// MARK: - CollectionView Extentions
extension GameDetailsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        selectedGame?.shortScreenshots?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "screenshotsCollectionCell", for: indexPath) as? ScreenshotsCollectionCell,
              let screenShotUrl = selectedGame?.shortScreenshots?[indexPath.row].screenshotUrl else { return UICollectionViewCell() }
        cell.gameImageUrl = screenShotUrl
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 350, height: 200)
    }
}
