//
//  SectionViewModel.swift
//  newhome
//
//  Created by Nicolá Domingues on 20/04/2021.
//

import UIKit
import IGListKit

class SectionViewModel: NSObject {
    
    var title: String
    
    init(title: String) {
        self.title = title
    }
}

extension SectionViewModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return isEqual(object)
    }
    
}
