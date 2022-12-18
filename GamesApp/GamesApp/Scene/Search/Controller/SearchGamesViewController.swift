//
//  SearchGamesViewController.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 7.12.2022.
//

import UIKit

final class SearchGamesViewController: BaseViewController {

    @IBOutlet private weak var searchTableView: UITableView!
    @IBOutlet private weak var searchIcon: UIImageView!
    @IBOutlet private weak var emptyTableViewLabel: UILabel!
    private var viewModel: SearchGamesViewModelProtocol = SearchGamesViewModel()
    var timer: Timer?
    var games: [Game]?
    var page = 1
    var searchText = ""
    
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
        emptyTableViewLabel.text = "Please search a game to add note.".localized()
    }
    
    func configureGameSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search a game to add note.".localized()
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
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY >= contentHeight - height - 100 {
            viewModel.paginationStarted = true
            page += 1
            self.viewModel.fetchSearchedGames(query: searchText, page: page)
        }
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
                self.viewModel.fetchSearchedGames(query: searchText, page: self.page)
                self.searchText = searchText
                self.emptyTableViewLabel.isHidden = true
                self.searchIcon.isHidden = true
            })
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        page = 1
        self.searchText = ""
        viewModel.paginationStarted = false
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
