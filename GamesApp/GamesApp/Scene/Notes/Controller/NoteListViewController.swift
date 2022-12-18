//
//  NoteListViewController.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 7.12.2022.
//

import UIKit

final class NoteListViewController: UIViewController {

    @IBOutlet private weak var notesTableView: UITableView!
    @IBOutlet private weak var emptyNoteMessageLabel: UILabel!
    @IBOutlet private weak var emptyNoteImage: UIImageView!
    var notes: [NotesCoreData]?
    var viewModel: NoteListViewModelProtocol = NoteListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        fetchNotesFromCoreData()
        viewModel.delegate = self
    }
    
    func configureTableView() {
        notesTableView.delegate = self
        notesTableView.dataSource = self
        
        notesTableView.register(UINib(nibName: "NotesTableViewCell", bundle: nil), forCellReuseIdentifier: "noteTableCell")
        emptyNoteMessageLabel.text = "There is no added note. \nTo add note please click add(+) button.".localized()
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
            emptyNoteImage.isHidden = true
        } else {
            emptyNoteMessageLabel.isHidden = false
            emptyNoteImage.isHidden = false
        }
    }
    
    @IBAction func addNoteButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toSearch", sender: nil)
    }
    
    func presentAddNoteVC(index: Int) {
        guard let notes = notes else { return }
        var addNoteVC = AddNoteViewController()
        addNoteVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addNoteVC") as! AddNoteViewController
        addNoteVC.modalPresentationStyle  = .overFullScreen
        addNoteVC.modalTransitionStyle    = .crossDissolve
        addNoteVC.gameFromNoteList = notes[index]
        addNoteVC.isFromAddButton = false
        self.present(addNoteVC, animated: true)
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        185
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentAddNoteVC(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let notes = notes else { return }
            viewModel.deleteNote(note: notes[indexPath.row])
        }
    }
}

extension NoteListViewController: NoteListViewModelDelegate {
    func coreDataChanged() {
        fetchNotesFromCoreData()
    }
}
