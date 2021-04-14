//
//  AuthButtonGenerator.swift
//  newhome
//
//  Created by Nicolá Domingues on 14/04/2021.
//

import UIKit

class AuthButtonGenerator {
    
    var buttons: [AuthButton] = []
    
    let signoutButton = AuthButton(name: "Signout", image: AppProfileIcons.signoutIcon)
    
    func generateButtons() -> [AuthButton] {
        let buttons = [signoutButton]
        self.buttons = buttons
        return buttons
    }
}
    
