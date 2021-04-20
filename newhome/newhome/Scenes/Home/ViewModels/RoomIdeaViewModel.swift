//
//  RoomIdeaViewModel.swift
//  newhome
//
//  Created by Nicolá Domingues on 20/04/2021.
//

import UIKit
import IGListKit

class RoomIdeaViewModel: NSObject {
    var label: String
    var image: UIImage
    var isLiked: Bool
    
    init(label: String, image: UIImage, isLiked: Bool) {
        self.label = label
        self.image = image
        self.isLiked = isLiked
    }
}

extension RoomIdeaViewModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return isEqual(object)
    }
    
}
