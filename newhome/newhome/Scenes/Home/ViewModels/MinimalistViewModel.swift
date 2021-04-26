//
//  MinimalisticViewModel.swift
//  newhome
//
//  Created by Nicolá Domingues on 26/04/2021.
//

import UIKit
import IGListKit

class MinimalistViewModel: NSObject {
    var label: String
    var type: String
    var price: String
    var image: UIImage
    
    init(label: String, type: String, price: String, image: UIImage) {
        self.label = label
        self.type = type
        self.price = price
        self.image = image
    }
}

extension MinimalistViewModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return isEqual(object)
    }
    
}
