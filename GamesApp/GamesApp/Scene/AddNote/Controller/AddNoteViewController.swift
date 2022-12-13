//
//  AddNoteViewController.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 7.12.2022.
//

import UIKit

class AddNoteViewController: BaseViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var releaseDataLabel: UILabel!
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var metacriticLabel: UILabel!
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    var viewModel: AddNoteViewModelProtocol = AddNoteViewModel()
    var gameFromSearch: Game?
    var gameFromNoteList: NotesCoreData?
    var isFromAddButton: Bool = true
    var isPreviouslyAdded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAllComponents()
        configureComponentView()
    }
    
    func configureComponentView() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        gameImageView.layer.cornerRadius = 15
        noteTextView.layer.cornerRadius = 15
        containerView.layer.cornerRadius = 20
        containerView.layer.shadowColor = UIColor.systemGray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        containerView.layer.shadowRadius = 15
        containerView.layer.shadowOpacity = 0.9
        containerView.layer.masksToBounds = false
    }
    
    func configureAllComponents() {
        if isFromAddButton {
            guard let game = gameFromSearch else { return }
            if let addedNote = viewModel.getNoteIfPrevioslyAdded(id: game.gameId) {
                isPreviouslyAdded = true
                noteTextView.text = addedNote
            }
            configureComponentsFromGameModel()
        } else {
            configureComponentsFromCoreDataModel()
        }
    }
    
    func configureComponentsFromGameModel() {
        gameNameLabel.text = gameFromSearch?.name
        releaseDataLabel.text = gameFromSearch?.releaseFormattedDate
        gameImageView.sd_setImage(with: gameFromSearch?.backgroundUrl)
        ratingLabel.text = gameFromSearch?.ratingString
        metacriticLabel.text = gameFromSearch?.metacriticString
    }
    
    func configureComponentsFromCoreDataModel() {
        guard let game = gameFromNoteList,
              let imageURLString = game.gameImage
        else { return }
        gameNameLabel.text = game.gameName
        releaseDataLabel.text = game.gameReleased
        gameImageView.sd_setImage(with: URL(string: imageURLString))
        ratingLabel.text = game.raiting
        metacriticLabel.text = game.metacritic
        noteTextView.text = game.note
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        viewModel.controlAndSave(isFromAddButton: isFromAddButton, isPreviouslyAdded: isPreviouslyAdded, gameFromSearch: gameFromSearch, note: noteTextView.text, gameFromNoteList: gameFromNoteList) { error in
            showAlert(title: "Empty Field", message: error)
        }
        self.dismiss(animated: true)
    }
    
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        dismiss(animated: true)
    }
}
