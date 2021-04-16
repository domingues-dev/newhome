//
//  ButtonGenerator.swift
//  newhome
//
//  Created by Nicolá Domingues on 14/04/2021.
//

import UIKit

class ButtonGenerator {
    
    var buttons: [ButtonViewModel] = []
    
    let purchaseButton = ButtonViewModel(name: "My Purchases", image: AppProfileIcons.purchaseIcon)
    let addressButton = ButtonViewModel(name: "Addresses Book", image: AppProfileIcons.addressIcon)
    let walletButton = ButtonViewModel(name: "My Wallet", image: AppProfileIcons.walletIcon)
    
    func generateButtons() -> [ButtonViewModel] {
        let buttons = [purchaseButton, addressButton, walletButton]
        self.buttons = buttons
        return buttons
    }
    
}
