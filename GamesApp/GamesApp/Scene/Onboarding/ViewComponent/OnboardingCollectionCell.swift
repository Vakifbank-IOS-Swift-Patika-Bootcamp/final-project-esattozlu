//
//  OnboardingCollectionCell.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 15.12.2022.
//

import UIKit

class OnboardingCollectionCell: UICollectionViewCell {

    @IBOutlet weak var onboardingImageView: UIImageView!
    @IBOutlet weak var onboardingDescriptionLabel: UILabel!
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
