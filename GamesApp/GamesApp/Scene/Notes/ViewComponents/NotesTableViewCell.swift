//
//  NotesTableViewCell.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 12.12.2022.
//

import UIKit

final class NotesTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var gameNameLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var gameImageView: UIImageView!
    @IBOutlet private weak var gameNote: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var metacriticLabel: UILabel!
    var note: NotesCoreData? {
        didSet{
            configureLabels()
        }
    }
    
    func configureLabels() {
        if let url = note?.gameImage {
            gameImageView.sd_setImage(with: URL(string: url))
        } else {
            gameImageView.sd_setImage(with: AssetExtractor.createLocalUrl(forImageNamed: "emptyImage"))
        }
        gameNameLabel.text = note?.gameName
        releaseDateLabel.text = note?.gameReleased
        gameNote.text = note?.note
        ratingLabel.text = note?.raiting
        metacriticLabel.text = note?.metacritic
        
        configureCell()
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
