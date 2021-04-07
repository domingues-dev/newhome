//
//  BaseNavigationController.swift
//  newhome
//
//  Created by Nicolá Domingues on 07/04/2021.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.prefersLargeTitles = true
        
        navigationBar.titleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 16),
            .foregroundColor: UIColor(named: "dark-blue") ?? UIColor.black
        ]
        
        navigationBar.largeTitleTextAttributes = [
            .font: UIFont(name: "Lato-Bold", size: 36) ?? UIFont.boldSystemFont(ofSize: 36),
            .foregroundColor: UIColor(named: "dark-blue") ?? UIColor.black
        ]
    }
}
