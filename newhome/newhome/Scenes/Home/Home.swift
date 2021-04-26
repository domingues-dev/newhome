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
    func updateView(with roomIdeaSection: RoomIdeasSectionViewModel)
    func updateView(with roomIdeas: [RoomIdeaViewModel])
    
    func updateView(with categorySection: CategorySectionViewModel)
    func updateView(with categories: [CategoryViewModel])
    
    func updateView(with minimalistSection: MinimalistSectionViewModel)
    func updateView(with choices: [MinimalistViewModel])
}

// Communication from view to presenter
protocol HomePresenterProtocol: class {
    func viewDidLoad()
}

// Communication from presenter to interactor
protocol HomeBusinessInteractor: class {
    func getRoomIdeaSection()
    func loadRoomIdeas()
    
    func getCategorySection()
    func loadCategories()
    
    func getMinimalistSection()
    func loadMinimalistChoices()
    
}

// Communication from interactor to presenter
protocol HomeBusinessPresenter: class {
    func didGetRoomIdeaSection(_ sections: RoomIdeasSectionViewModel)
    func didLoadRoomIdeas(_ roomIdeas: [RoomIdeaViewModel])
    
    func didGetCategorySection(_ section: CategorySectionViewModel)
    func didLoadCategories(_ categories: [CategoryViewModel])
    
    func didGetMinimalistSection(_ section: MinimalistSectionViewModel)
    func didLoadMinimalistChoices(_ choices: [MinimalistViewModel])
}
