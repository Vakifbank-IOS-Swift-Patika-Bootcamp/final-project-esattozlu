//
//  SearchTableViewCell.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 12.12.2022.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var metacriticLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var platformsLabel: UILabel!
    
    var game: Game? {
        didSet {
            configureCell()
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
