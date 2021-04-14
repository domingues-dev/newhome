//
//  CollectionView+ReuseIdentifier.swift
//  newhome
//
//  Created by Nicolá Domingues on 09/04/2021.
//

import UIKit

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
    // swiftlint:enable force_cast
    
}
