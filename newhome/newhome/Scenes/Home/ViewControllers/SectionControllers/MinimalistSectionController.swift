//
//  MinimalistSectionController.swift
//  newhome
//
//  Created by Nicolá Domingues on 26/04/2021.
//

import UIKit
import IGListKit

class MinimalistSectionController: ListSectionController {
    
    // MARK: - Properties
    var entry: MinimalistSectionViewModel!
    var choices: [MinimalistViewModel] = []
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(
            updater: ListAdapterUpdater(),
            viewController: self.viewController,
            workingRangeSize: .zero)
    }()
    
    // MARK: - Initialization
    
    override init() {
        super.init()
        adapter.dataSource = self
        self.supplementaryViewSource = self
    }
}

extension MinimalistSectionController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return entry.items
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return ChoicesSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}

extension MinimalistSectionController {
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func didUpdate(to object: Any) {
        entry = object as? MinimalistSectionViewModel
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else { return .zero }
        let width = context.containerSize.width
        return CGSize(width: width, height: 400)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = EmbeddedVerticalCollectionViewCell.dequeue(from: self, for: index)
        adapter.collectionView = cell.collectionView
        return cell
    }
}

extension MinimalistSectionController: ListSupplementaryViewSource {
    func supportedElementKinds() -> [String] {
        return [UICollectionView.elementKindSectionHeader]
    }
    
    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        let view = HeaderSectionSupplementaryCell.dequeueSupllementaryView(of: elementKind, from: self, for: index)
        view.minimalistSection = entry
        return view
    }
    
    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        guard let context = collectionContext else { return .zero }
        let width = context.containerSize.width
        return CGSize(width: width, height: 50)
    }
}
