//
//  ProfilePictureSectionController.swift
//  newhome
//
//  Created by Nicolá Domingues on 14/04/2021.
//

import UIKit
import IGListKit

class ProfilePictureSectionController: ListSectionController {
    
    // MARK: - Properties
    
    var entry: UserEntryViewModel!
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    }
}

// MARK: - Data Provider

extension ProfilePictureSectionController {
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        let width = context.containerSize.width
        return CGSize(width: width, height: 200)
    }
    
    override func didUpdate(to object: Any) {
        entry = object as? UserEntryViewModel
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = ProfilePictureCollectionViewCell.dequeue(from: self, for: index)
        cell.user = entry
        return cell
    }
    
}
