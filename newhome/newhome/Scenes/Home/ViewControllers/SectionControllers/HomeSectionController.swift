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
    
    var entry: RoomIdeasSectionViewModel!
    var roomIdeas: [RoomIdeaViewModel] = []
    
    lazy var adapter: ListAdapter = {
       return ListAdapter(
        updater: ListAdapterUpdater(),
        viewController: self.viewController,
        workingRangeSize: .zero)
    }()
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 30, left: 0, bottom: 20, right: 0)
        adapter.dataSource = self
        self.supplementaryViewSource = self
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
        entry = object as? RoomIdeasSectionViewModel
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = EmbeddedCollectionViewCell.dequeue(from: self, for: index)
        adapter.collectionView = cell.collectionView
        return cell
    }
    
}

extension HomeSectionController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return entry.items
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let roomIdeaSectionController = RoomIdeaSectionController()
        return roomIdeaSectionController
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}

extension HomeSectionController: ListSupplementaryViewSource {
    func supportedElementKinds() -> [String] {
        return [UICollectionView.elementKindSectionHeader]
    }
    
    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        let view = RoomIdeaSupplementaryHeader.dequeueSupllementaryView(of: elementKind, from: self, for: index)
        view.section = entry
        return view
    }
    
    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        let width = context.containerSize.width
        return CGSize(width: width, height: 40)
    }
    
}
