//
//  NotesTableViewCell.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 12.12.2022.
//

import UIKit

class NotesTableViewCell: UITableViewCell {
    
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
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
