//
//  CategoryLoader.swift
//  newhome
//
//  Created by Nicolá Domingues on 26/04/2021.
//

import UIKit

class CategoryLoader {
    
    var categories: [CategoryViewModel] = []
    
    func loadCategories() -> [CategoryViewModel] {
        
        guard let furnitureImage = UIImage(named: "furniture"),
              let lightingImage = UIImage(named: "lighting"),
              let decorationImage = UIImage(named: "decoration")
        else {
            return []
        }
        return [
            CategoryViewModel(label: "Furniture", image: furnitureImage),
            CategoryViewModel(label: "Lighting", image: lightingImage),
            CategoryViewModel(label: "Decoration", image: decorationImage)
        ]
    }
}
