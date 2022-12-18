//
//  CoreDataNotesTest.swift
//  GamesAppTests
//
//  Created by Hasan Esat Tozlu on 18.12.2022.
//

import XCTest
@testable import GamesApp

final class CoreDataNotesTest: XCTestCase {
    var addNoteViewModel: AddNoteViewModel!
    var noteListViewModel: NoteListViewModel!
    let mockGame1 = Game(gameId: 1, name: "name", released: "released", backgroundImage: "backgroundImage", rating: 5.0, metacritic: 100, suggestionsCount: 100, reviewsCount: 100, parentPlatforms: [ParentPlatform(platform: Platform(id: 1, name: "Platform"))], genres: [Genre(id: 1, name: "Genre")], shortScreenshots: [ShortScreenshot(id: 1, image: "ShortScreenshot")])
    let mockGame2 = Game(gameId: 2, name: "name2", released: "released2", backgroundImage: "backgroundImage2", rating: 5.0, metacritic: 100, suggestionsCount: 100, reviewsCount: 100, parentPlatforms: [ParentPlatform(platform: Platform(id: 2, name: "Platform2"))], genres: [Genre(id: 2, name: "Genre2")], shortScreenshots: [ShortScreenshot(id: 2, image: "ShortScreenshot2")])
    let mockGame3 = Game(gameId: 3, name: "name3", released: "released3", backgroundImage: "backgroundImage3", rating: 5.0, metacritic: 100, suggestionsCount: 100, reviewsCount: 100, parentPlatforms: [ParentPlatform(platform: Platform(id: 2, name: "Platform3"))], genres: [Genre(id: 2, name: "Genre3")], shortScreenshots: [ShortScreenshot(id: 2, image: "ShortScreenshot3")])
    
    override func setUpWithError() throws {
        addNoteViewModel = AddNoteViewModel()
        noteListViewModel = NoteListViewModel()
    }

    func testCoreDataNotes() throws {
        addNoteViewModel.saveNote(game: mockGame1, note: "note")
        XCTAssertEqual(addNoteViewModel.getNoteIfPrevioslyAdded(id: 1), "note")
        
        addNoteViewModel.updateNote(id: 1, note: "note updated")
        XCTAssertEqual(addNoteViewModel.getNoteIfPrevioslyAdded(id: 1), "note updated")
        
        addNoteViewModel.controlAndSave(isFromAddButton: true, isPreviouslyAdded: true, gameFromSearch: mockGame1, note: "note updated2", gameFromNoteList: nil) {_ in }
        XCTAssertEqual(addNoteViewModel.getNoteIfPrevioslyAdded(id: 1), "note updated2")
        
        addNoteViewModel.controlAndSave(isFromAddButton: true, isPreviouslyAdded: false, gameFromSearch: mockGame2, note: "note for game2", gameFromNoteList: nil) {_ in }
        XCTAssertEqual(addNoteViewModel.getNoteIfPrevioslyAdded(id: 2), "note for game2")
        
        noteListViewModel.fetchNotes().forEach { noteListViewModel.deleteNote(note: $0) }
    }
}
