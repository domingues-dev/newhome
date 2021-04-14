//
//  Profile.swift
//  newhome
//
//  Created by Nicolá Domingues on 07/04/2021.
//

import Foundation

// Communication from presenter to view
protocol ProfileViewProtocol: class {
    func isLoading(_ loading: Bool)
    func updateTitle(_ title: String)
    func updateView(with users: [UserEntry])
    func updateView(with buttons: [Button])
    func updateView(with buttons: [AuthButton])

}

// Communication from view to presenter
protocol ProfilePresenterProtocol: class {
    func viewDidLoad()
}

// Communication from presenter to interactor
protocol ProfileBusinessInteractor: class {
    func fetchUser()
    func getButtons()
    func getAuthButtons()
}

// Communication from interactor to presenter
protocol ProfileBusinessPresenter: class {
    func didFetchUsers(_ user: [UserEntry])
    func didGetButtons(_ buttons: [Button])
    func didGetAuthButtons(_ buttons: [AuthButton])
}
