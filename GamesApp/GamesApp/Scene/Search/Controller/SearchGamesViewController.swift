//
//  SearchGamesViewController.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 7.12.2022.
//

import UIKit

class SearchGamesViewController: BaseViewController {

    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchIcon: UIImageView!
    @IBOutlet weak var emptyTableViewLabel: UILabel!
    private var viewModel: SearchGamesViewModelProtocol = SearchGamesViewModel()
    var timer: Timer?
    var games: [Game]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGameSearchController()
        configureTableView()
        viewModel.delegate = self
    }
    
    func configureTableView() {
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        searchTableView.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "searchTableViewCell")
        emptyTableViewLabel.text = "Please search a game to add note."
    }
    
    func configureGameSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search a game to add note."
        searchController.searchBar.delegate = self
        searchController.searchBar.becomeFirstResponder()
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func presentAddNoteVC(index: Int) {
        var addNoteVC = AddNoteViewController()
        addNoteVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addNoteVC") as! AddNoteViewController
        addNoteVC.modalPresentationStyle  = .overFullScreen
        addNoteVC.modalTransitionStyle    = .crossDissolve
        addNoteVC.gameFromSearch = viewModel.getGames(at: index)
        addNoteVC.viewModel.delegate = self
        self.present(addNoteVC, animated: true)
    }
}

extension SearchGamesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.gamesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchTableViewCell", for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        cell.game = viewModel.getGames(at: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        165
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentAddNoteVC(index: indexPath.row)
    }
}


extension SearchGamesViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        if searchText == ""{
            viewModel.clearGames()
            emptyTableViewLabel.isHidden = false
            searchIcon.isHidden = false
        } else {
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
                self.showActivityIndicator()
                self.viewModel.fetchSearchedGames(query: searchText, page: 1)
                self.emptyTableViewLabel.isHidden = true
                self.searchIcon.isHidden = true
            })
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.clearGames()
        emptyTableViewLabel.isHidden = false
        searchIcon.isHidden = false
    }
}

extension SearchGamesViewController: SearchGamesViewModelDelegate {
    func gamesLoaded() {
        self.stopActivityIndicator()
        searchTableView.reloadData()
    }
}

extension SearchGamesViewController: AddNoteViewModelDelegate {
    func noteSaved() {
        navigationController?.popViewController(animated: true)
    }
}
