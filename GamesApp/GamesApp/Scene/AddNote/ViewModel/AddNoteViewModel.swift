//
//  AddNoteViewModel.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 13.12.2022.
//

import Foundation

protocol AddNoteViewModelProtocol {
    var delegate: AddNoteViewModelDelegate? { get set }
    func saveNote(game: Game, note: String)
    func updateNote(id: Int, note: String)
    func getNoteIfPrevioslyAdded(id: Int) -> String?
    func controlAndSave(isFromAddButton: Bool, isPreviouslyAdded: Bool, gameFromSearch: Game?, note: String?, gameFromNoteList: NotesCoreData?, completion: (_ error: String) -> Void)
}

protocol AddNoteViewModelDelegate: AnyObject {
    func noteSaved()
}

final class AddNoteViewModel: AddNoteViewModelProtocol {
    weak var delegate: AddNoteViewModelDelegate?
    
    func saveNote(game: Game, note: String) {
        CoreDataManager.shared.saveToNotes(game: game, note: note) {
            delegate?.noteSaved()
        }
    }
    
    func updateNote(id: Int, note: String) {
        CoreDataManager.shared.updateNote(id: id, note: note)
        delegate?.noteSaved()
    }
    
    func getNoteIfPrevioslyAdded(id: Int) -> String? {
        return CoreDataManager.shared.checkNote(id: id)?.note
    }
    
    func controlAndSave(isFromAddButton: Bool, isPreviouslyAdded: Bool, gameFromSearch: Game?, note: String?, gameFromNoteList: NotesCoreData?, completion: (_ error: String) -> Void) {
        if isFromAddButton {
            if isPreviouslyAdded {
                guard let game = gameFromSearch,
                      let note = note,
                      note != ""
                else {
                    completion("Note field cannot be empty. Please enter a note.")
                    return
                }
                updateNote(id: game.gameId, note: note)
            } else {
                guard let game = gameFromSearch,
                      let note = note,
                      note != ""
                else {
                    completion("Note field cannot be empty. Please enter a note.")
                    return
                }
                saveNote(game: game, note: note)
            }
        } else {
            guard let game = gameFromNoteList,
            let note = note,
            note != ""
            else {
                completion("Note field cannot be empty. Please enter a note.")
                return
            }
            let id = Int(game.gameId)
            updateNote(id: id, note: note)
        }
    }
}
