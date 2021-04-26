//
//  MinimalisticLoader.swift
//  newhome
//
//  Created by Nicolá Domingues on 26/04/2021.
//

import UIKit

class MinimalistLoader {
    
    var choices: [MinimalistViewModel] = []
    
    func loadChoices() -> [MinimalistViewModel] {
        
        guard let greyChairImage = UIImage(named: "grey-chair"),
              let blueChairImage = UIImage(named: "blue-chair"),
              let brownChairImage = UIImage(named: "brown-chair")
        else {
            return []
        }
        return [
            MinimalistViewModel(
                label: "Zlatan's",
                type: "Chair",
                price: "175",
                image: greyChairImage),
            MinimalistViewModel(
                label: "Totti's",
                type: "Chair",
                price: "200",
                image: blueChairImage),
            MinimalistViewModel(label: "Del Piero's", type: "Chair", price: "215", image: brownChairImage)
        ]
    }
}
