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
        inset = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 0)
    }
}

extension RoomIdeaSectionController {
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else { return .zero }
        let height = context.containerSize.height
        return CGSize(width: 200, height: height)
    }
    
    override func didUpdate(to object: Any) {
        roomIdea = object as? RoomIdeaViewModel
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = RoomIdeaCollectionViewCell.dequeue(from: self, for: index)
        cell.roomIdea = roomIdea
        return cell
    }
}
