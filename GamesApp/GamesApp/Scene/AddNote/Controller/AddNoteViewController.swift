//
//  AddNoteViewController.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 7.12.2022.
//

import UIKit

final class AddNoteViewController: BaseViewController {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var gameNameLabel: UILabel!
    @IBOutlet private weak var releaseDataLabel: UILabel!
    @IBOutlet private weak var gameImageView: UIImageView!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var metacriticLabel: UILabel!
    @IBOutlet private weak var noteTextView: UITextView!
    @IBOutlet private weak var saveButton: UIButton!
    var viewModel: AddNoteViewModelProtocol = AddNoteViewModel()
    var gameFromSearch: Game?
    var gameFromNoteList: NotesCoreData?
    var isFromAddButton: Bool = true
    var isPreviouslyAdded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAllComponents()
        configureComponentView()
        hideKeyboardWhenTappedAround()
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
        guard let game = gameFromNoteList else { return }
        if let url = game.gameImage {
            gameImageView.sd_setImage(with: URL(string: url))
        } else {
            gameImageView.sd_setImage(with: AssetExtractor.createLocalUrl(forImageNamed: "emptyImage"))
        }
        gameNameLabel.text = game.gameName
        releaseDataLabel.text = game.gameReleased
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
