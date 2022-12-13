//
//  NotesTableViewCell.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 12.12.2022.
//

import UIKit

class NotesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var gameNote: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var metacriticLabel: UILabel!
    var note: NotesCoreData? {
        didSet{
            configureLabels()
        }
    }
    
    func configureLabels() {
        gameNameLabel.text = note?.gameName
        releaseDateLabel.text = note?.gameReleased
        gameImageView.sd_setImage(with: URL(string: note?.gameImage ?? ""))
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
