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
        tabBar.backgroundColor = AppColors.white
        tabBar.tintColor = AppColors.blue
        navigationController?.navigationBar.backgroundColor = AppColors.white
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
        homeViewController.tabBarItem = UITabBarItem(title: nil, image: AppTabBarIcons.homeIcon, tag: 0)
        return homeViewController
    }
    
    private func configureCategoryViewController() -> UIViewController {
        let categoryViewController = CategoryViewController()
        categoryViewController.tabBarItem = UITabBarItem(title: nil, image: AppTabBarIcons.categoryIcon, tag: 1)
        return categoryViewController
    }
    
    private func configureSavedViewController() -> UIViewController {
        let savedViewController = FavoriteItemsViewController()
        savedViewController.tabBarItem = UITabBarItem(title: nil, image: AppTabBarIcons.likedIcon, tag: 2)
        return savedViewController
    }
    
    private func configureMapViewController() -> UIViewController {
        let mapViewController = MapViewController()
        mapViewController.tabBarItem = UITabBarItem(title: nil, image: AppTabBarIcons.mapIcon, tag: 3)
        return mapViewController
    }
    
    private func configureProfileViewController() -> UIViewController {
        let profileViewController = ProfileViewController()
        let profileIntercator = ProfileInteractor()
        let profilePresenter = ProfilePresenter(view: profileViewController, interactor: profileIntercator)
        profileViewController.presenter = profilePresenter
        
        profileViewController.tabBarItem = UITabBarItem(title: nil, image: AppTabBarIcons.profileIcon, tag: 4)
        return BaseNavigationController(rootViewController: profileViewController)
    }
    
}
