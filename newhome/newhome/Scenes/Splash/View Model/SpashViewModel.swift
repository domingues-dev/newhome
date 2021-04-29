//
//  File.swift
//  newhome
//
//  Created by Nicolá Domingues on 28/04/2021.
//

import UIKit

class SplashViewModel {
    var image: UIImage
    var title: String
    var description: String
    
    init(image: UIImage, title: String, description: String) {
        self.image = image
        self.title = title
        self.description = description
    }
}
