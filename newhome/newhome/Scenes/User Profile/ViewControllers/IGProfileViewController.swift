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
    var userEntries: [UserEntryViewModel] = []
    var buttons: [ButtonViewModel] = []
    var authButtons: [AuthButtonViewModel] = []
    
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
        items += buttons
        items += authButtons
        return items
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is UserEntryViewModel {
            return ProfilePictureSectionController()
        } else if object is ButtonViewModel {
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
    func updateView(with buttons: [AuthButtonViewModel]) {
        authButtons = buttons
    }
    
    func updateView(with buttons: [ButtonViewModel]) {
        self.buttons = buttons
    }
    
    func updateView(with users: [UserEntryViewModel]) {
        userEntries = users
    }
    
    func isLoading(_ loading: Bool) {
        
    }
    
    func updateTitle(_ title: String) {
        self.navigationItem.title = title
    }

}
