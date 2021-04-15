//
//  ButtonProperties.swift
//  newhome
//
//  Created by Nicolá Domingues on 13/04/2021.
//

import UIKit

class Button: NSObject {
    var image: UIImage
    var name: String
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
    
}
