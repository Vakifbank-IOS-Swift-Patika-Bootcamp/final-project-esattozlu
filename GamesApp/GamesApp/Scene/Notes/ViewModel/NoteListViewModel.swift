//
//  NoteListViewModel.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 12.12.2022.
//

import Foundation

protocol NoteListViewModelProtocol {
    var delegate: NoteListViewModelDelegate? { get set }
    func fetchNotes() -> [NotesCoreData]
    func deleteNote(note: NotesCoreData)
}

protocol NoteListViewModelDelegate: AnyObject {
    func coreDataChanged()
}

final class NoteListViewModel: NoteListViewModelProtocol {
    weak var delegate: NoteListViewModelDelegate?
    
    init() {
        CoreDataManager.shared.notesDelegate = self
    }
    
    func fetchNotes() -> [NotesCoreData] {
        return CoreDataManager.shared.getNotes {}
    }
    
    func deleteNote(note: NotesCoreData) {
        let id = Int(note.gameId)
        CoreDataManager.shared.deleteNote(gameId: id) {}
    }
}

extension NoteListViewModel: CoreDataManagerDelegate {
    func coreDataUpdated() {
        DispatchQueue.main.async {
            self.delegate?.coreDataChanged()
        }
    }
}
