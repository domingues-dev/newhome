//
//  ButtonProperties.swift
//  newhome
//
//  Created by Nicolá Domingues on 13/04/2021.
//

import UIKit

/* Review: Would be nice to have ViewModel suffix here */
class Button: NSObject {
    var image: UIImage
    var name: String
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
    
}
