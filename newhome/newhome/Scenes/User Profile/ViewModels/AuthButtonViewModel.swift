//
//  AuthButton.swift
//  newhome
//
//  Created by Nicolá Domingues on 14/04/2021.
//

import UIKit
import IGListKit

class AuthButtonViewModel: NSObject {
    var image: UIImage
    var name: String
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
    
}

extension AuthButtonViewModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return isEqual(object)
    }
}
