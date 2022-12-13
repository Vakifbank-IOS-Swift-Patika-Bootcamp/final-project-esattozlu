//
//  GameCollectionCell.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 7.12.2022.
//

import UIKit
import SDWebImage

class GameCollectionCell: UICollectionViewCell {

    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var raitingLabel: UILabel!
    @IBOutlet weak var metacriticLabel: UILabel!
    
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
    }
    
    func configureComponents(model: Game) {
        gameImageView.sd_setImage(with: model.backgroundUrl)
        gameNameLabel.text = model.name
        releaseDateLabel.text = model.releaseFormattedDate
        genreLabel.text = model.genreText ?? "Unspecified"
        platformLabel.text = model.parentPlatformText ?? "Unspecified"
        raitingLabel.text = model.ratingString
        metacriticLabel.text = model.metacriticString
        
        configureCell()
    }
}
