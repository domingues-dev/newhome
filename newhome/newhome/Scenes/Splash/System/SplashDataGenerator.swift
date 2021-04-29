//
//  SplashDataGenerator.swift
//  newhome
//
//  Created by Nicolá Domingues on 28/04/2021.
//

import UIKit

class SplashDataGenerator {
    
    func generateSplashScreens() -> [SplashViewModel] {
        
        guard let image0 = UIImage(named: "room-idea-1"),
              let image1 = UIImage(named: "room-idea-2"),
              let image2 = UIImage(named: "room-idea-3")
        else { return [] }
        
        let splash0 = SplashViewModel(
            image: image0,
            title: "Discover Latest Trends",
            description: "Over thousands of stylist products online")
        
        let splash1 = SplashViewModel(
            image: image1,
            title: "Add to my whishlist",
            description: "Choose the items you are more interested")
        
        let splash2 = SplashViewModel(
            image: image2,
            title: "Its simple for you",
            description: "Smart experience from browsing to history")
        
        return [splash0, splash1, splash2]
    }
}
