//
//  AuthButton.swift
//  newhome
//
//  Created by Nicolá Domingues on 14/04/2021.
//

import UIKit

/* Review: Would be nice to have ViewModel suffix here */
class AuthButton: NSObject {
    var image: UIImage
    var name: String
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
    
}
