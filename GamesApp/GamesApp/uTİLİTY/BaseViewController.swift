//
//  BaseViewController.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 7.12.2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.tintColor = .systemBackground
        view.hidesWhenStopped = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = .systemBackground
        return view
    }()
    private let indicatorContainer: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicatorView()
    }
    
    func showActivityIndicator() {
        indicatorView.startAnimating()
        view.addSubview(indicatorContainer)
    }
    
    func stopActivityIndicator() {
        indicatorView.stopAnimating()
        indicatorContainer.removeFromSuperview()
    }
    
    
    private func setupActivityIndicatorView() {
        indicatorContainer.frame = view.frame
        indicatorContainer.backgroundColor = UIColor(white: 0, alpha: 0.7)
        indicatorContainer.addSubview(indicatorView)
        setupActivityIndicatorViewConstraints()
    }
        
    private func setupActivityIndicatorViewConstraints() {
      NSLayoutConstraint.activate([
        indicatorView.centerXAnchor.constraint(equalTo: indicatorContainer.centerXAnchor),
        indicatorView.centerYAnchor.constraint(equalTo: indicatorContainer.centerYAnchor)
      ])
    }
    
    func showAlert(title: String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }

}
