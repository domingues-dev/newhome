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
    func updateView(with sections: [SectionViewModel])
    func updateView(with roomIdeas: [RoomIdeaViewModel])
}

// Communication from view to presenter
protocol HomePresenterProtocol: class {
    func viewDidLoad()
}

// Communication from presenter to interactor
protocol HomeBusinessInteractor: class {
    func getSections()
    func loadRoomIdeas()
}

// Communication from interactor to presenter
protocol HomeBusinessPresenter: class {
    func didGetSections(_ sections: [SectionViewModel])
    func didLoadRoomIdeas(_ roomIdeas: [RoomIdeaViewModel])
}
