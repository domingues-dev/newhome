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
    func updateView(with users: [UserEntryViewModel])
    func updateView(with buttons: [ButtonViewModel])
    func updateView(with buttons: [AuthButtonViewModel])

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
    func didFetchUsers(_ user: [UserEntryViewModel])
    func didGetButtons(_ buttons: [ButtonViewModel])
    func didGetAuthButtons(_ buttons: [AuthButtonViewModel])
}
