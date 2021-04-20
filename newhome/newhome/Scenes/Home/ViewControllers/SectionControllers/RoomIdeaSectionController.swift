//
//  RoomIdeaSectionController.swift
//  newhome
//
//  Created by Nicolá Domingues on 20/04/2021.
//

import UIKit
import IGListKit

class RoomIdeaSectionController: ListSectionController {
    
    var roomIdea: RoomIdeaViewModel!
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
    }
}

extension RoomIdeaSectionController {
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else { return .zero }
        let width = context.containerSize.width
        return CGSize(width: width, height: 200)
    }
    
    override func didUpdate(to object: Any) {
        roomIdea = object as? RoomIdeaViewModel
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = RoomIdeaView.dequeue(from: self, for: index)
        return cell
    }
    
}
