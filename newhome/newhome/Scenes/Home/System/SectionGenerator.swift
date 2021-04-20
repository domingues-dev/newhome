//
//  SectionGenerator.swift
//  newhome
//
//  Created by Nicolá Domingues on 20/04/2021.
//

import Foundation

class SectionGenerator {
    
    var sections: [SectionViewModel] = []
    
    func generateSections() -> [SectionViewModel] {
        let sections = [
            SectionViewModel(title: "You need to explore today"),
            SectionViewModel(title: "Category"),
            SectionViewModel(title: "Minimalistic choice"),
            SectionViewModel(title: "Hot looks")
        ]
            self.sections = sections
        return sections
    }
    
}
