//
//  ChoicesSectionController.swift
//  newhome
//
//  Created by Nicolá Domingues on 26/04/2021.
//

import UIKit
import IGListKit

class ChoicesSectionController: ListSectionController {
    
    // MARK: - Properties
    
    var choice: MinimalistViewModel!
    
    // MARK: - Initialization
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
}

extension ChoicesSectionController {
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func didUpdate(to object: Any) {
        choice = object as? MinimalistViewModel
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else { return .zero }
        let width = context.containerSize.width
        return CGSize(width: width, height: 100)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = ChoiceCollectionViewCell.dequeue(from: self, for: index)
        cell.choice = choice
        return cell
    }
}
