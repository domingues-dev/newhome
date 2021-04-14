//
//  ProfileInteractor.swift
//  newhome
//
//  Created by Nicolá Domingues on 07/04/2021.
//

import Foundation

class ProfileInteractor {
    
    // MARK: - Properties
    
    weak var presenter: ProfileBusinessPresenter!
    let userLoader = UserLoader()
    let buttonGenerator = ButtonGenerator()
    let authButtonGenerator = AuthButtonGenerator()
    
}

// MARK: - ProfileBusinessInteractor

extension ProfileInteractor: ProfileBusinessInteractor {
    func getAuthButtons() {
        self.presenter.didGetAuthButtons(authButtonGenerator.generateButtons())
    }
    
    func getButtons() {
        self.presenter.didGetButtons(buttonGenerator.generateButtons())
    }
    
    func fetchUser() {
        self.presenter.didFetchUsers(userLoader.loadUser())
    }
    
}
