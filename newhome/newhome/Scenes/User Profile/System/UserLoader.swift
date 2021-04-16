//
//  UserEntry.swift
//  newhome
//
//  Created by Nicolá Domingues on 14/04/2021.
//

import UIKit

class UserLoader {
    
    var entries: [UserEntryViewModel] = []
    
    func loadUser() -> [UserEntryViewModel] {
        guard let profileImage = UIImage(named: "profile-picture") else {
            return []
        }
        let entries = [
            UserEntryViewModel(name: "Matt Cummings", profileImage: profileImage)
        ]
        return entries
    }
}
