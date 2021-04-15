//
//  NSObject+ListDiffable.swift
//  newhome
//
//  Created by Nicolá Domingues on 14/04/2021.
//

import Foundation

import IGListKit

// MARK: - ListDiffable

/* Review: This extension is not nice.. Only view models that will be used by section controllers
 should conform to ListDiffable protocol, and each class should conform to it, so they can define
 their own diffIdentifier and isEqual methods, as it is importants to take full advantage of IGListKit
 diffable algorightm and animated insertions/deletions
 */
extension NSObject: ListDiffable {
    public func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return isEqual(object)
    }
}
