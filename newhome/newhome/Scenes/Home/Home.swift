//
//  Home.swift
//  newhome
//
//  Created by Nicolá Domingues on 20/04/2021.
//

import Foundation


// Communication from presenter to view
protocol HomeViewProtocol: class {
    func isLoading(_ loading: Bool)

}

// Communication from view to presenter
protocol HomePresenterProtocol: class {
    func viewDidLoad()
}

// Communication from presenter to interactor
protocol HomeBusinessInteractor: class {
}

// Communication from interactor to presenter
protocol HomeBusinessPresenter: class {
}
