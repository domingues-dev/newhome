//
//  CollectionView+ReuseIdentifier.swift
//  newhome
//
//  Created by Nicolá Domingues on 09/04/2021.
//

import UIKit
import IGListKit

extension UICollectionViewCell {
    
    class var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static func register(in collectionView: UICollectionView) {
        collectionView.register(self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // swiftlint:disable force_cast
    static func dequeue(from collectionView: UICollectionView, for indexPath: IndexPath) -> Self {
        return collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                  for: indexPath) as! Self
    }
    
    static func dequeue(from sectionController: ListSectionController, for indexPath: Int) -> Self {
        return sectionController.collectionContext?.dequeueReusableCell(
            of: Self.self, for: sectionController, at: indexPath) as! Self
    }
    // swiftlint:enable force_cast
}

extension UICollectionReusableView {
    
    // swiftlint:disable force_cast
    static func dequeueSupllementaryView(of kind: String, from sectionController: ListSectionController, for index: Int) -> Self {
        return sectionController.collectionContext?.dequeueReusableSupplementaryView(
            ofKind: kind,
            for: sectionController,
            class: Self.self,
            at: index) as! Self
    }
    // swiftlint:enable force_cast
}
