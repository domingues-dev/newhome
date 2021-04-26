//
//  HomeInteractor.swift
//  newhome
//
//  Created by Nicolá Domingues on 20/04/2021.
//

import Foundation

class HomeInteractor {
    
    // MARK: - Properties
    
    weak var presenter: HomeBusinessPresenter!
    let sectionGenerator = SectionGenerator()
    let roomIdeaLoader = RoomIdeaLoader()
}

// MARK: - HomeBusinessInteractor

extension HomeInteractor: HomeBusinessInteractor {
    func getRoomIdeaSection() {
        self.presenter.didGetRoomIdeaSection(sectionGenerator.generateRoomIdeaSection())
    }
    
    func loadRoomIdeas() {
        self.presenter.didLoadRoomIdeas(roomIdeaLoader.loadRoomIdeas())
    }
    
}
