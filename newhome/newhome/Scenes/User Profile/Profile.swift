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
}

// Communication from view to presenter
protocol ProfilePresenterProtocol: class {
    func viewDidLoad()
}

// Communication from presenter to interactor
protocol ProfileBusinessInteractor: class {
    
}

// Communication from interactor to presenter
protocol ProfileBusinessPresenter: class {
    
}
