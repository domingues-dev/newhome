//
//  HomeViewController.swift
//  newhome
//
//  Created by Nicolá Domingues on 07/04/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: HomePresenterProtocol!
    
    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        navigationItem.title = "Home"
    }
}

// MARK: - HomeViewProtocol

extension HomeViewController: HomeViewProtocol {
    
    func isLoading(_ loading: Bool) {
    }
    
}
