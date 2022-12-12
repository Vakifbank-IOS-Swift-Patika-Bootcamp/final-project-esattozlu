//
//  SmallGamesCollectionCell.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 9.12.2022.
//

import UIKit

class SmallGamesCollectionCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var raitingLabel: UILabel!
    @IBOutlet weak var metacriticLabel: UILabel!
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
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 15
        layer.shadowOpacity = 0.3
        layer.masksToBounds = false
        
        gameImageView.layer.cornerRadius = 15
    }
    
    func configureComponents() {
        guard let game = game else { return }
        gameImageView.sd_setImage(with: URL(string: game.gameImage!))
        gameNameLabel.text = game.gameName
        releaseLabel.text = game.gameReleased
        genreLabel.text = game.genres ?? "Unspecified"
        platformLabel.text = game.platforms
        raitingLabel.text = game.raiting
        metacriticLabel.text = game.metacritic
        
        configureCell()
    }
}
