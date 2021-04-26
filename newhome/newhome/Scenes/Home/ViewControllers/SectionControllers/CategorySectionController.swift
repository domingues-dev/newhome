//
//  CategorySectionController.swift
//  newhome
//
//  Created by Nicolá Domingues on 26/04/2021.
//

import UIKit
import IGListKit

class CategorySectionController: ListSectionController {
    
    // MARK: - Properties
    
    var entry: CategorySectionViewModel!
    var categories: [CategoryViewModel] = []
    
    lazy var adapter: ListAdapter = {
       return ListAdapter(
        updater: ListAdapterUpdater(),
        viewController: self.viewController,
        workingRangeSize: .zero)
    }()
    
    // MARK: - Initialization
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        adapter.dataSource = self
        self.supplementaryViewSource = self
    }
}

extension CategorySectionController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return entry.items
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return CategoriesSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}

extension CategorySectionController {
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        let width = context.containerSize.width
        return CGSize(width: width, height: 150)
    }
    
    override func didUpdate(to object: Any) {
        entry = object as? CategorySectionViewModel
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = EmbeddedCollectionViewCell.dequeue(from: self, for: index)
        adapter.collectionView = cell.collectionView
        return cell
    }
}

extension CategorySectionController: ListSupplementaryViewSource {
    func supportedElementKinds() -> [String] {
        return [UICollectionView.elementKindSectionHeader]
    }
    
    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        let view = HeaderSectionSupplementaryCell.dequeueSupllementaryView(of: elementKind, from: self, for: index)
        view.section = entry
        return view
    }
    
    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        let width = context.containerSize.width
        return CGSize(width: width, height: 60)
    }
    
}
