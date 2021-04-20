//
//  HomePresenter.swift
//  newhome
//
//  Created by Nicolá Domingues on 20/04/2021.
//

import Foundation

class HomePresenter {
    
    // MARK: - Properties
    
    private weak var view: HomeViewProtocol!
    private var interactor: HomeBusinessInteractor!
    
    // MARK: - Initialization
    
    init(view: HomeViewProtocol, interactor: HomeBusinessInteractor) {
        self.view = view
        self.interactor = interactor
    }
    
}

// MARK: - HomeBusinessPresenter

extension HomePresenter: HomeBusinessPresenter {
    
}

// MARK: - HomePresenterProtocol

extension HomePresenter: HomePresenterProtocol {
    
    func viewDidLoad() {
    }
    
}
