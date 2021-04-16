//
//  AuthButtonGenerator.swift
//  newhome
//
//  Created by Nicolá Domingues on 14/04/2021.
//

import UIKit

class AuthButtonGenerator {
    
    var buttons: [AuthButtonViewModel] = []
    
    let signoutButton = AuthButtonViewModel(name: "Signout", image: AppProfileIcons.signoutIcon)
    
    func generateButtons() -> [AuthButtonViewModel] {
        let buttons = [signoutButton]
        self.buttons = buttons
        return buttons
    }
}
    
