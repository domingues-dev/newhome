//
//  ProfilePresenter.swift
//  newhome
//
//  Created by Nicolá Domingues on 07/04/2021.
//

import Foundation

class ProfilePresenter {
    
    // MARK: - Properties
    
    private weak var view: ProfileViewProtocol!
    private var interactor: ProfileBusinessInteractor!
    
    // MARK: - Initialization
    
    init(view: ProfileViewProtocol, interactor: ProfileBusinessInteractor) {
        self.view = view
        self.interactor = interactor
    }
    
}

// MARK: - ProfileBusinessPresenter

extension ProfilePresenter: ProfileBusinessPresenter {
    func didGetAuthButtons(_ buttons: [AuthButtonViewModel]) {
        view.updateView(with: buttons)
    }
    
    func didGetButtons(_ buttons: [ButtonViewModel]) {
        view.updateView(with: buttons)
    }
    
    func didFetchUsers(_ user: [UserEntryViewModel]) {
        view.updateView(with: user)
    }
    
}

// MARK: - ProfilePresenterProtocol

extension ProfilePresenter: ProfilePresenterProtocol {
    
    func viewDidLoad() {
        view.updateTitle("profile_tab_title".localized)
        interactor.fetchUser()
        interactor.getButtons()
        interactor.getAuthButtons()
    }
    
}
