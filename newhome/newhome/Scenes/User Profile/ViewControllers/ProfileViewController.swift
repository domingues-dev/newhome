//
//  ProfileViewController.swift
//  newhome
//
//  Created by Nicolá Domingues on 07/04/2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK - Properties
    
    var presenter: ProfilePresenterProtocol!
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = AppColors.white
        return cv
    }()
    
     //MARK - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.white
        presenter.viewDidLoad()
        view.addSubview(collectionView)
        setupCollectionView()
        setupCollectionViewLayout()
    }
    
    fileprivate func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        ProfilePictureCollectionViewCell.register(in: collectionView)
        PurchaseButtonCollectionViewCell.register(in: collectionView)
        AddressButtonCollectionViewCell.register(in: collectionView)
        WalletButtonCollectionViewCell.register(in: collectionView)
        SignoutButtonCollectionViewCell.register(in: collectionView)
    }
    
    fileprivate func setupCollectionViewLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

}

//MARK - ProfileViewProtocol

extension ProfileViewController: ProfileViewProtocol {
    func isLoading(_ loading: Bool) {
        
    }
    
    func updateTitle(_ title: String) {
        self.navigationItem.title = title
    }
}

//MARK - UICollectionViewDelegateFlowLayout

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: view.bounds.width, height: view.bounds.height / 4)
        }
        return CGSize(width: view.bounds.width, height: 75)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        30
    }

}

//MARK - UICollectionViewDataSource

extension ProfileViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let profilePictureCell = ProfilePictureCollectionViewCell.dequeue(from: collectionView, for: indexPath)
        let purchaseButtonCell = PurchaseButtonCollectionViewCell.dequeue(from: collectionView, for: indexPath)
        let addressButtonCell = AddressButtonCollectionViewCell.dequeue(from: collectionView, for: indexPath)
        let walletButtonCell = WalletButtonCollectionViewCell.dequeue(from: collectionView, for: indexPath)
        let signoutButtonCell = SignoutButtonCollectionViewCell.dequeue(from: collectionView, for: indexPath)
        
        switch indexPath.section {
        case 1:
            switch indexPath.item {
            case 0:
                return purchaseButtonCell
            case 1:
                return addressButtonCell
            case 2:
                return walletButtonCell
            default:
                return signoutButtonCell
            }
        default:
            return profilePictureCell
        
        }
    }
    
}
