//
//  IGProfileViewController.swift
//  newhome
//
//  Created by Nicolá Domingues on 14/04/2021.
//

import UIKit
import IGListKit

class IGProfileViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: ProfilePresenterProtocol!
    var userLoader: UserLoader!
    var userEntries: [UserEntry] = []
    var buttons: [Button] = []
    var authButtons: [AuthButton] = []
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.alwaysBounceVertical = true
        cv.backgroundColor = AppColors.white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(
            updater: ListAdapterUpdater(),
            viewController: self,
            workingRangeSize: 0)
    }()
    
    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.white
        presenter.viewDidLoad()
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - ListAdapterDataSource

extension IGProfileViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var items: [ListDiffable] = userEntries
        items += buttons as [ListDiffable]
        items += authButtons as [ListDiffable]
        return items
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is UserEntry {
            return ProfilePictureSectionController()
        } else if object is Button {
            return ProfileButtonsSectionController()
        } else {
            return AuthButtonsSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}

// MARK: - ProfileViewProtocol

extension IGProfileViewController: ProfileViewProtocol {
    func updateView(with buttons: [AuthButton]) {
        authButtons = buttons
    }
    
    func updateView(with buttons: [Button]) {
        self.buttons = buttons
    }
    
    func updateView(with users: [UserEntry]) {
        userEntries = users
    }
    
    func isLoading(_ loading: Bool) {
        
    }
    
    func updateTitle(_ title: String) {
        self.navigationItem.title = title
    }

}
