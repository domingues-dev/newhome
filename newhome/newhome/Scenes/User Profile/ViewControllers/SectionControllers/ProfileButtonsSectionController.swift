//
//  ProfileButtonsSectionController.swift
//  newhome
//
//  Created by Nicolá Domingues on 14/04/2021.
//

import UIKit
import IGListKit

class ProfileButtonsSectionController: ListSectionController {
    
    // MARK: - Properties
    
    var button: Button!
    
    // MARK: - Initialization
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    }
}

// MARK: - Data Provider

extension ProfileButtonsSectionController {
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        let width = context.containerSize.width
        return CGSize(width: width, height: 75)
    }
    
    override func didUpdate(to object: Any) {
        button = object as? Button
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cellClass: AnyClass =  ButtonCollectionViewCell.self
        let cell = collectionContext!.dequeueReusableCell(of: cellClass, for: self, at: index)
        if let cell = cell as? ButtonCollectionViewCell {
            cell.button.label.text = button.name
            cell.button.icon.iconImageView.image = button.image
        }
        
        return cell
    }
}
