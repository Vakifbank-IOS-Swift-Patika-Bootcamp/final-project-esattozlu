//
//  NoteListViewModel.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 12.12.2022.
//

import Foundation

protocol NoteListViewModelProtocol {
    func fetchNotes() -> [NotesCoreData]
}

class NoteListViewModel: NoteListViewModelProtocol {
    func fetchNotes() -> [NotesCoreData] {
        return CoreDataManager.shared.getNotes {}
    }
    
    
}
