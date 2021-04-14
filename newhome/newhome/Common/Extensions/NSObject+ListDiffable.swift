//
//  NSObject+ListDiffable.swift
//  newhome
//
//  Created by Nicolá Domingues on 14/04/2021.
//

import Foundation

import IGListKit

// MARK: - ListDiffable

extension NSObject: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    return self
  }

  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    return isEqual(object)
  }
}
