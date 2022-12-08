//
//  GameDetailsView.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 8.12.2022.
//

import UIKit

class GameDetailsView: UIView {

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
    var gameDetail: GameDetail? {
        didSet {
            DispatchQueue.main.async {
                self.configureLabels()
                self.configureCollectionView()
            }
        }
    }
    
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
    
    private func configureLabels() {
        guard let selectedGame = selectedGame,
              let gameDetail = gameDetail else { return }
        gameImageView.sd_setImage(with: selectedGame.backgroundUrl)
        releasedLabel.text = selectedGame.releaseFormattedDate
        raitingLabel.text = selectedGame.ratingString
        raitingBelowLabel.text = selectedGame.ratingString
        gameNameLabel.text = selectedGame.name
        metacriticsLabel.text = selectedGame.metacriticString
        genresLabel.text = selectedGame.genreText
        suggestionLabel.text = "\(selectedGame.suggestionCountString) user suggestions"
        reviewsLabel.text = "\(selectedGame.reviewsCountString) reviews"
        publishersLabel.text = gameDetail.publishersString
        gameDescriptionLabel.text = gameDetail.descriptionRaw
    }
    
    private func configureCollectionView() {
        screenshotsCollectionView.delegate = self
        screenshotsCollectionView.dataSource = self
        screenshotsCollectionView.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        screenshotsCollectionView.register(UINib(nibName: "ScreenshotsCollectionCell", bundle: nil), forCellWithReuseIdentifier: "screenshotsCollectionCell")
    }
}

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
