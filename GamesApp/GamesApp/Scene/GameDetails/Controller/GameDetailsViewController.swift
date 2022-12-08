//
//  GameDetailsViewController.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 7.12.2022.
//

import UIKit

class GameDetailsViewController: BaseViewController {

    let scrollView = UIScrollView()
    let stackView = UIStackView()
    var selectedGame: Game?
    var detailsView: GameDetailsView?
    private var viewModel: GameDetailsViewModelProtocol = GameDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDetailsView()
        configureScrollView()
        viewModel.delegate = self
    }
    
    func createDetailsView() {
        guard let selectedGame = selectedGame else { return }
        viewModel.fetchGameDetail(id: selectedGame.gameId)
    }
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        stackView.axis = .vertical
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
}

extension GameDetailsViewController: GameDetailsViewModelDegelegate {
    func gameDetailLoaded() {
        let gameDetail = viewModel.getGameDetail()
        detailsView = GameDetailsView()
        detailsView?.gameDetail = gameDetail
        detailsView?.selectedGame = selectedGame
        stackView.addArrangedSubview(detailsView!)
    }
}
