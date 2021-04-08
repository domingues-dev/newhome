//
//  Colors.swift
//  newhome
//
//  Created by Nicolá Domingues on 08/04/2021.
//

import UIKit

enum AppColors {
    
    static var white: UIColor { UIColor.white }
    static var black: UIColor { UIColor.black }
    static var blue: UIColor { UIColor(named: "blue") ?? #colorLiteral(red: 0.2156862745, green: 0.3725490196, blue: 0.8784313725, alpha: 1) }
    static var darkBlue: UIColor { UIColor(named: "dark-blue") ?? #colorLiteral(red: 0.1803921569, green: 0.1960784314, blue: 0.3960784314, alpha: 1) }
    static var lightBlue: UIColor { UIColor(named: "light-blue") ?? #colorLiteral(red: 0.8588235294, green: 0.9254901961, blue: 1, alpha: 1) }
    static var lightGrey: UIColor { UIColor(named: "light-grey") ?? #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9607843137, alpha: 1) }
    
}
