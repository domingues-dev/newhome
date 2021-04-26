//
//  MinimalistSectionViewModel.swift
//  newhome
//
//  Created by Nicolá Domingues on 26/04/2021.
//

import UIKit
import IGListKit

class MinimalistSectionViewModel: NSObject {
    
    var title: String
    var items: [MinimalistViewModel] = []
    
    init(title: String) {
        self.title = title
    }
}

extension MinimalistSectionViewModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return title as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard let rhs = object as? MinimalistSectionViewModel else { return false }
        return title == rhs.title && items == rhs.items
    }
    
}
