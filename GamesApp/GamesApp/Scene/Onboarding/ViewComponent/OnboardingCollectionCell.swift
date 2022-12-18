//
//  OnboardingCollectionCell.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 15.12.2022.
//

import UIKit

final class OnboardingCollectionCell: UICollectionViewCell {

    @IBOutlet private weak var onboardingImageView: UIImageView!
    @IBOutlet private weak var onboardingDescriptionLabel: UILabel!
    var onboardingModel: OnboardingModel? {
        didSet {
            onboardingImageView.image = onboardingModel?.image
            onboardingDescriptionLabel.text = onboardingModel?.description
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
