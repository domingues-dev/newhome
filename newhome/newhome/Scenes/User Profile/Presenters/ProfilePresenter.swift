//
//  ProfilePresenter.swift
//  newhome
//
//  Created by Nicolá Domingues on 07/04/2021.
//

import Foundation

class ProfilePresenter {
    
    //MARK: - Properties
    
    private weak var view: ProfileViewProtocol!
    private var interactor: ProfileBusinessInteractor!
    
    //MARK: - Initialization
    
    init(view: ProfileViewProtocol, interactor: ProfileBusinessInteractor) {
        self.view = view
        self.interactor = interactor
    }
    
}

//MARK: - ProfileBusinessPresenter

extension ProfilePresenter: ProfileBusinessPresenter {
    
}

//MARK: - ProfilePresenterProtocol

extension ProfilePresenter: ProfilePresenterProtocol {
    func viewDidLoad() {
        
    }
    
    
}
