//
//  ScreenshotsCollectionCell.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 8.12.2022.
//

import UIKit
import SDWebImage

final class ScreenshotsCollectionCell: UICollectionViewCell {

    @IBOutlet private weak var screenshotsImageView: UIImageView!
    var gameImageUrl: URL? {
        didSet {
            screenshotsImageView.sd_setImage(with: gameImageUrl)
            configureImageView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configureImageView() {
        screenshotsImageView.layer.cornerRadius = 15
        screenshotsImageView.clipsToBounds = true
        screenshotsImageView.contentMode = .scaleAspectFill
    }
}
