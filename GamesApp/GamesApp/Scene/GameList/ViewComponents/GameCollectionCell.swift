//
//  GameCollectionCell.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 7.12.2022.
//

import UIKit
import SDWebImage

final class GameCollectionCell: UICollectionViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var gameImageView: UIImageView!
    @IBOutlet private weak var gameNameLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!
    @IBOutlet private weak var platformLabel: UILabel!
    @IBOutlet private weak var raitingLabel: UILabel!
    @IBOutlet private weak var metacriticLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func configureCell() {
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
