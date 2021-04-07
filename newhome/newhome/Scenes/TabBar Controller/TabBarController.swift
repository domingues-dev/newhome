//
//  TabBarController.swift
//  newhome
//
//  Created by Nicolá Domingues on 07/04/2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        tabBar.tintColor = #colorLiteral(red: 0.2156862745, green: 0.3725490196, blue: 0.8784313725, alpha: 1)
        tabBar.isTranslucent = false
        setViewControllers(
            [
                configureHomeViewController(),
                configureCategoryViewController(),
                configureMapViewController(),
                configureSavedViewController(),
                configureProfileViewController()
                
            ],
            animated: true)
    }
    
    private func configureHomeViewController() -> UIViewController {
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "home-icon"), tag: 0)
        return homeViewController
    }
    
    private func configureCategoryViewController() -> UIViewController {
        let categoryViewController = CategoryViewController()
        categoryViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "category-icon"), tag: 1)
        return categoryViewController
    }
    
    private func configureSavedViewController() -> UIViewController {
        let savedViewController = SavedViewController()
        savedViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "saved-icon"), tag: 2)
        return savedViewController
    }
    
    private func configureMapViewController() -> UIViewController {
        let mapViewController = MapViewController()
        mapViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "map-icon"), tag: 3)
        return mapViewController
    }
    
    private func configureProfileViewController() -> UIViewController {
        let profileViewController = ProfileViewController()
        let profileIntercator = ProfileInteractor()
        let profilePresenter = ProfilePresenter(view: profileViewController, interactor: profileIntercator)
        profileViewController.presenter = profilePresenter
        
        profileViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "profile-icon"), tag: 4)
        return profileViewController
    }
    
}
