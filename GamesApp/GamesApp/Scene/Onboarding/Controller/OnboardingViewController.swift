//
//  OnboardingViewController.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 15.12.2022.
//

import UIKit

final class OnboardingViewController: UIViewController {

    @IBOutlet private weak var onboardingCollectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    let viewModel = OnboardingViewModel()
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == viewModel.getPageCount() - 1 {
                continueButton.setTitle("Get started".localized(), for: .normal)
            } else {
                continueButton.setTitle("Next".localized(), for: .normal)
                continueButton.titleLabel?.font = UIFont(name: "System", size: 19)
            }
        }
    }
    
    @IBOutlet private weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LocalNotificationManager.shared.requestNotificationAuthorization()
        configureCollectionView()
    }
    
    func configureCollectionView() {
        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
        onboardingCollectionView.register(UINib(nibName: "OnboardingCollectionCell", bundle: nil), forCellWithReuseIdentifier: "onboardingCell")
    }
    
    @IBAction func continueButtonClicked(_ sender: Any) {
        if currentPage == viewModel.getPageCount() - 1 {
            let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeVCTabBar") as? UITabBarController

                        self.view.window?.rootViewController = homeViewController
                        self.view.window?.makeKeyAndVisible()
        } else {
            currentPage += 1
            pageControl.currentPage = currentPage
            let indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getPageCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboardingCell", for: indexPath) as? OnboardingCollectionCell else { return UICollectionViewCell() }
        cell.onboardingModel = viewModel.getPageDetails(at: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        viewModel.getSizeForItem(width: view.bounds.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
