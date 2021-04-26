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
    func didLoadCategories(_ categories: [CategoryViewModel]) {
        view.upadteView(with: categories)
    }
    
    func didGetCategorySection(_ section: CategorySectionViewModel) {
        view.updateView(with: section)
    }
    
    func didGetRoomIdeaSection(_ sections: RoomIdeasSectionViewModel) {
        view.updateView(with: sections)
    }
    
    func didLoadRoomIdeas(_ roomIdeas: [RoomIdeaViewModel]) {
        view.updateView(with: roomIdeas)
    }
    
}

// MARK: - HomePresenterProtocol

extension HomePresenter: HomePresenterProtocol {
    
    func viewDidLoad() {
        interactor.getRoomIdeaSection()
        interactor.getCategorySection()
        interactor.loadRoomIdeas()
        interactor.loadCategories()
    }
}
