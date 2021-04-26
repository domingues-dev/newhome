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
    func didGetMinimalistSection(_ section: MinimalistSectionViewModel) {
        view.updateView(with: section)
    }
    
    func didLoadMinimalistChoices(_ choices: [MinimalistViewModel]) {
        view.updateView(with: choices)
    }
    
    func didLoadCategories(_ categories: [CategoryViewModel]) {
        view.updateView(with: categories)
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
        interactor.getMinimalistSection()
        interactor.loadMinimalistChoices()
    }
}
