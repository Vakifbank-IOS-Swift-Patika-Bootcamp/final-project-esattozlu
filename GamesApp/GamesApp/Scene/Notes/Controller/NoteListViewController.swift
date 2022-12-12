//
//  NoteListViewController.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 7.12.2022.
//

import UIKit

class NoteListViewController: UIViewController {

    @IBOutlet weak var notesTableView: UITableView!
    @IBOutlet weak var emptyNoteMessageLabel: UILabel!
    var notes: [NotesCoreData]?
    var viewModel: NoteListViewModelProtocol = NoteListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        fetchNotesFromCoreData()
    }
    
    func configureTableView() {
        notesTableView.delegate = self
        notesTableView.dataSource = self
        
        notesTableView.register(UINib(nibName: "NotesTableViewCell", bundle: nil), forCellReuseIdentifier: "noteTableCell")
    }
    
    func fetchNotesFromCoreData() {
        notes = viewModel.fetchNotes()
        DispatchQueue.main.async {
            self.notesTableView.reloadData()
            self.checkNote()
        }
    }
    
    func checkNote() {
        guard let notes = notes else { return }
        if !notes.isEmpty {
            emptyNoteMessageLabel.isHidden = true
        }
    }
    
    @IBAction func addNoteButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toSearch", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromNotesToAddNote" {
            guard let index = sender as? Int else { return }
            
        }
    }
}

extension NoteListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "noteTableCell", for: indexPath) as? NotesTableViewCell,
              let notes = notes
        else { return UITableViewCell() }
        cell.note = notes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "fromNotesToAddNote", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        }
    }
    
}
