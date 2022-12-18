//
//  SearchTableViewCell.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 12.12.2022.
//

import UIKit

final class SearchTableViewCell: UITableViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var gameImageView: UIImageView!
    @IBOutlet private weak var releasedLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var metacriticLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!
    @IBOutlet private weak var gameNameLabel: UILabel!
    @IBOutlet private weak var platformsLabel: UILabel!
    
    var game: Game? {
        didSet {
            configureComponents()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell() {
        containerView.layer.cornerRadius = 20
        layer.cornerRadius = 20
        containerView.layer.shadowColor = UIColor.systemGray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        containerView.layer.shadowRadius = 15
        containerView.layer.shadowOpacity = 0.9
        gameImageView.layer.cornerRadius = 15
    }
    
    func configureComponents() {
        guard let game = game else { return }
        gameImageView.sd_setImage(with: game.backgroundUrl)
        gameNameLabel.text = game.name
        releasedLabel.text = game.releaseFormattedDate
        genreLabel.text = game.genreText ?? "Unspecified"
        platformsLabel.text = game.parentPlatformText
        ratingLabel.text = game.ratingString
        metacriticLabel.text = game.metacriticString
        
        configureCell()
    }
}
