//
//  UserModel.swift
//  newhome
//
//  Created by Nicolá Domingues on 14/04/2021.
//

import UIKit

/* Review: Would be nice to have ViewModel suffix here */
class UserEntry: NSObject {
    let name: String
    let profileImage: UIImage
    
    init(name: String, profileImage: UIImage) {
        self.name = name
        self.profileImage = profileImage
    }
}
