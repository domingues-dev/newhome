//
//  HomeViewController.swift
//  newhome
//
//  Created by Nicolá Domingues on 07/04/2021.
//

import UIKit
import IGListKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: HomePresenterProtocol!
    var roomIdeas: [RoomIdeaViewModel] = []
    var roomIdeaSection: RoomIdeasSectionViewModel!
    var categorySection: CategorySectionViewModel!
    var categories: [CategoryViewModel] = []
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = AppColors.white
        return cv
    }()
    
    lazy var adapter: ListAdapter = {
       return ListAdapter(
        updater: ListAdapterUpdater(),
        viewController: self,
        workingRangeSize: .zero)
    }()
    
    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        adapter.collectionView = collectionView
        adapter.dataSource = self
        navigationItem.title = "Home"
    }
}

// MARK: -

extension HomeViewController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var items: [ListDiffable] = []
        items.append(roomIdeaSection)
        items.append(categorySection)
        return items
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let homeSectionController = HomeSectionController()
        let categorySectionController = CategorySectionController()
        if object is CategorySectionViewModel {
            categorySectionController.categories = categorySection.items
            return categorySectionController
        }
        homeSectionController.roomIdeas = roomIdeaSection.items
        return homeSectionController
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        nil
    }
    
}

// MARK: - HomeViewProtocol

extension HomeViewController: HomeViewProtocol {
    func upadteView(with categories: [CategoryViewModel]) {
        categorySection.items = categories
    }
    
    func updateView(with categorySection: CategorySectionViewModel) {
        self.categorySection = categorySection
    }
    
    func updateView(with roomIdeas: [RoomIdeaViewModel]) {
        roomIdeaSection.items = roomIdeas
    }
    
    func updateView(with roomIdeaSection: RoomIdeasSectionViewModel) {
        self.roomIdeaSection = roomIdeaSection
    }
    
    func isLoading(_ loading: Bool) {
    }
    
}
