//
//  UserModel.swift
//  newhome
//
//  Created by Nicolá Domingues on 14/04/2021.
//

import UIKit
import IGListKit

class UserEntryViewModel: NSObject {

    let name: String
    let profileImage: UIImage
    
    init(name: String, profileImage: UIImage) {
        self.name = name
        self.profileImage = profileImage
    }
    
}

extension UserEntryViewModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return isEqual(object)
    }  
}
