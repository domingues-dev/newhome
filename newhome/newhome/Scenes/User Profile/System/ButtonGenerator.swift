//
//  ButtonGenerator.swift
//  newhome
//
//  Created by Nicolá Domingues on 14/04/2021.
//

import UIKit

class ButtonGenerator {
    
    var buttons: [Button] = []
    
    let purchaseButton = Button(name: "My Purchases", image: AppProfileIcons.purchaseIcon)
    let addressButton = Button(name: "Addresses Book", image: AppProfileIcons.addressIcon)
    let walletButton = Button(name: "My Wallet", image: AppProfileIcons.walletIcon)
    
    func generateButtons() -> [Button] {
        let buttons = [purchaseButton, addressButton, walletButton]
        self.buttons = buttons
        return buttons
    }
    
}
