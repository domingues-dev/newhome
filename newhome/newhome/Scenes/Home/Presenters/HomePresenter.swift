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
    func didLoadRoomIdeas(_ roomIdeas: [RoomIdeaViewModel]) {
        view.updateView(with: roomIdeas)
    }
    
    func didGetSections(_ sections: [SectionViewModel]) {
        view.updateView(with: sections)
    }
        
}

// MARK: - HomePresenterProtocol

extension HomePresenter: HomePresenterProtocol {
    
    func viewDidLoad() {
        interactor.getSections()
        interactor.loadRoomIdeas()
    }
    
}
