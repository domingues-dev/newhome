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
    
    var entry: UserEntry!
    
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
        entry = object as? UserEntry
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        /*
         Review: you could create a similiar extension like you have to dequeue cells from collection view
         */
        let cellClass: AnyClass = ProfilePictureCollectionViewCell.self
        let cell = collectionContext!.dequeueReusableCell(of: cellClass, for: self, at: index)
        if let cell = cell as? ProfilePictureCollectionViewCell {
            /*
             Review: This is not nice.. view interior views should be private to not be accessible
             like this. Cells should have the view model property so they can configure themselves
             
             Ex. cell.model = entry
             
             and in the ProfilePictureCollectionViewCell.swift file:
             
             var model: UserEntry? {
                didSet {
                    if let viewModel = model {
                        bindViewModel(model)
                    }
                }
             }
             
             */
            cell.profileImageView.imageView.image = entry.profileImage
            cell.profileName.text = entry.name
        }
        return cell
    }
    
}
