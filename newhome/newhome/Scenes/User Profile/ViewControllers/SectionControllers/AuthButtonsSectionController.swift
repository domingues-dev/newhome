//
//  AuthButtonsSectionController.swift
//  newhome
//
//  Created by Nicolá Domingues on 14/04/2021.
//

import UIKit
import IGListKit

class AuthButtonsSectionController: ListSectionController {
    
    var authButton: AuthButton!
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    }
    
}

extension AuthButtonsSectionController {
    
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
        authButton = object as? AuthButton
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cellClass: AnyClass =  SignoutButtonCollectionViewCell.self
        let cell = collectionContext!.dequeueReusableCell(of: cellClass, for: self, at: index)
        if let cell = cell as? SignoutButtonCollectionViewCell {
            cell.signoutButton.label.text = authButton.name
            cell.signoutButton.icon.iconImageView.image = authButton.image
        }
        
        return cell
    }
}
