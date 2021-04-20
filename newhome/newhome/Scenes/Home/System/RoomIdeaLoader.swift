//
//  RoomIdeaLoader.swift
//  newhome
//
//  Created by Nicolá Domingues on 20/04/2021.
//

import UIKit

class RoomIdeaLoader {
    
    var roomIdeas: [RoomIdeaViewModel] = []
    
    func loadRoomIdeas() -> [RoomIdeaViewModel] {
        guard let blueRoomImage = UIImage(named: "room-idea-1"),
              let greenRoomImage = UIImage(named: "room-idea-2"),
              let orangeRoomImage = UIImage(named: "room-idea-3"),
              let greyRoomImage = UIImage(named: "room-idea-4")
        else {
            return []
        }
        
        let roomIdeas = [
            RoomIdeaViewModel(label: "Modern Blue Room", image: blueRoomImage, isLiked: false),
            RoomIdeaViewModel(label: "Modern Green Room", image: greenRoomImage, isLiked: false),
            RoomIdeaViewModel(label: "Modern Orange Room", image: orangeRoomImage, isLiked: false),
            RoomIdeaViewModel(label: "Modern Grey Room", image: greyRoomImage, isLiked: false)
        ]
        self.roomIdeas = roomIdeas
        return roomIdeas
    }
}
