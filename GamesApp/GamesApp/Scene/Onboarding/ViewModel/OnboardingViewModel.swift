//
//  OnboardingViewModel.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 15.12.2022.
//

import UIKit

protocol OnboardingViewModelProtocol {
    var onboardingPages: [OnboardingModel] { get set }
    func getPageCount() -> Int
    func getPageDetails(at index: Int) -> OnboardingModel
    func getSizeForItem(width: CGFloat, height: CGFloat) -> CGSize
}

// MARK: - OnboardingViewModel
final class OnboardingViewModel: OnboardingViewModelProtocol {
    internal var onboardingPages: [OnboardingModel] = [
        OnboardingModel(description: "With the Game App, you can list the games on all platforms and examine their details.".localized(), image: UIImage(named: "Boarding1")),
        OnboardingModel(description: "You can add games to your favourites, then view your favorite game details and remove them from your favourites.".localized(), image: UIImage(named: "Boarding2")),
        OnboardingModel(description: "You can take notes about the games, revise the notes and view them whenever you want.".localized(), image: UIImage(named: "Boarding3"))
    ]
        
    func getPageCount() -> Int {
        return onboardingPages.count
    }
    
    func getPageDetails(at index: Int) -> OnboardingModel {
        return onboardingPages[index]
    }
    
    func getSizeForItem(width: CGFloat, height: CGFloat) -> CGSize {
        let padding: CGFloat            = 0
        let itemWidth                   = width - (padding*2)
        let itemHeight                  = height - (padding*2)
        return .init(width: itemWidth, height: itemHeight)
    }
}
