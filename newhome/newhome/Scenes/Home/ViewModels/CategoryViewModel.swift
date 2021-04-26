//
//  CategoryViewModel.swift
//  newhome
//
//  Created by Nicolá Domingues on 26/04/2021.
//

import UIKit
import IGListKit

class CategoryViewModel: NSObject {
    var label: String
    var image: UIImage
    
    init(label: String, image: UIImage) {
        self.label = label
        self.image = image
    }
}

extension CategoryViewModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return isEqual(object)
    }
    
}
