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

    static func dequeue(from collectionView: UICollectionView, for indexPath: IndexPath) -> Self {
        return collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                  for: indexPath) as! Self
    }
    
}
