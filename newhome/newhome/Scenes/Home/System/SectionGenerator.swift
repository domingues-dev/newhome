//
//  SectionGenerator.swift
//  newhome
//
//  Created by Nicolá Domingues on 20/04/2021.
//

import Foundation

class SectionGenerator {
    
    func generateRoomIdeaSection() -> RoomIdeasSectionViewModel {
        let section =
            RoomIdeasSectionViewModel(title: "You need to explore today")
        return section
    }
    
    func generateCategorySection() -> CategorySectionViewModel {
        let section = CategorySectionViewModel(title: "Category")
        return section
    }
    
    func generateMinimalistSection() -> MinimalistSectionViewModel {
        let section = MinimalistSectionViewModel(title: "Minimalist Choices")
        return section
    }
}