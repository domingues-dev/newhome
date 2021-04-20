//
//  HomeSectionController.swift
//  newhome
//
//  Created by Nicolá Domingues on 20/04/2021.
//

import UIKit
import IGListKit

class HomeSectionController: ListSectionController {
    
    // MARK: - Properties
    
    var entry: SectionViewModel!
    var roomIdeas: [RoomIdeaViewModel] = []
    
    lazy var adapter: ListAdapter = {
       return ListAdapter(
        updater: ListAdapterUpdater(),
        viewController: self.viewController,
        workingRangeSize: .zero)
    }()
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        adapter.dataSource = self
    }
    
}

// MARK: - Data Provider

extension HomeSectionController {
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        let width = context.containerSize.width
        return CGSize(width: width, height: 300)
    }
    
    override func didUpdate(to object: Any) {
        entry = object as? SectionViewModel
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = CollectionViewCell.dequeue(from: self, for: index)
        adapter.collectionView = cell.collectionView
        return cell
    }
    
}

extension HomeSectionController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return roomIdeas
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return RoomIdeaSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}
