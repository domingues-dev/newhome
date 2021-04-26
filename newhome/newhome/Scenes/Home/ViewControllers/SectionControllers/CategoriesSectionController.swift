//
//  CategoriesSectionController.swift
//  newhome
//
//  Created by Nicolá Domingues on 26/04/2021.
//

import UIKit
import IGListKit

class CategoriesSectionController: ListSectionController {
    
    // MARK: - Properties
    var category: CategoryViewModel!
    
    // MARK: - Initialization
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
}

extension CategoriesSectionController {
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func didUpdate(to object: Any) {
        category = object as? CategoryViewModel
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = CategoryViewCell.dequeue(from: self, for: index)
        cell.category = category
        return cell
    }
    
}
