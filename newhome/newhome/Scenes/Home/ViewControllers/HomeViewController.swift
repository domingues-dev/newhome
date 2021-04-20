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
    var sections: [SectionViewModel] = []
    var roomIdeas: [RoomIdeaViewModel] = []
    
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
        return sections
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        /* Review: This is the not so good thing I was referring in the `SectionViewModel.swift` file
           Would be better to check the type for RoomIdeasSectionViewModel and return that section controller
           and let IGListKit diffable algorithms work as it is expected
         */
        let sectionController = HomeSectionController()
        sectionController.roomIdeas = roomIdeas
        return sectionController
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        nil
    }
    
}

// MARK: - HomeViewProtocol

extension HomeViewController: HomeViewProtocol {
    func updateView(with roomIdeas: [RoomIdeaViewModel]) {
        self.roomIdeas = roomIdeas
    }
    
    func updateView(with sections: [SectionViewModel]) {
        self.sections = sections
    }
    
    func isLoading(_ loading: Bool) {
    }
    
}
