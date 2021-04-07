//
//  ProfileViewController.swift
//  newhome
//
//  Created by Nicolá Domingues on 07/04/2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK - Properties
    
    weak var presenter: ProfilePresenterProtocol!
    
    //MARK - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    }
}

//MARK - ProfileViewProtocol

extension ProfileViewController: ProfileViewProtocol {
    func isLoading(_ loading: Bool) {
        
    }
    
    func updateTitle(_ title: String) {
        
    }
    
    
}
