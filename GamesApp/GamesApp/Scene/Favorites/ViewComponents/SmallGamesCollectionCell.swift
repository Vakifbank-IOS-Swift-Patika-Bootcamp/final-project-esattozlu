//
//  SmallGamesCollectionCell.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 9.12.2022.
//

import UIKit

final class SmallGamesCollectionCell: UICollectionViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var gameImageView: UIImageView!
    @IBOutlet private weak var gameNameLabel: UILabel!
    @IBOutlet private weak var releaseLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!
    @IBOutlet private weak var platformLabel: UILabel!
    @IBOutlet private weak var raitingLabel: UILabel!
    @IBOutlet private weak var metacriticLabel: UILabel!
    var game: FavoritesCoreData? {
        didSet{
            configureComponents()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell() {
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.systemGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 15
        layer.shadowOpacity = 0.9
        layer.masksToBounds = false
        
        gameImageView.layer.cornerRadius = 15
    }
    
    func configureComponents() {
        guard let game = game else { return }
        if let url = game.gameImage {
            gameImageView.sd_setImage(with: URL(string: url))
        } else {
            gameImageView.sd_setImage(with: AssetExtractor.createLocalUrl(forImageNamed: "emptyImage"))
        }
        gameNameLabel.text = game.gameName
        releaseLabel.text = game.gameReleased
        genreLabel.text = game.genres ?? "Unspecified"
        platformLabel.text = game.platforms
        raitingLabel.text = game.raiting
        metacriticLabel.text = game.metacritic
        
        configureCell()
    }
}
