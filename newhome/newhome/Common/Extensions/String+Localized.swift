//
//  String+Localized.swift
//  newhome
//
//  Created by Nicolá Domingues on 15/04/2021.
//

import Foundation

extension String {
    
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
    
}
