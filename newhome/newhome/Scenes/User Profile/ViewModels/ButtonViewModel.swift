//
//  ButtonProperties.swift
//  newhome
//
//  Created by Nicolá Domingues on 13/04/2021.
//

import UIKit
import IGListKit

class ButtonViewModel: NSObject {
    var image: UIImage
    var name: String
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
    
}

extension ButtonViewModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return isEqual(object)
    }
}
