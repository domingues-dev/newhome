//
//  SplashViewController.swift
//  newhome
//
//  Created by Nicolá Domingues on 28/04/2021.
//

import UIKit

class SplashViewController: UIViewController {
    
    // MARK: - Properties
    var pageIndex: Int!
    
    var data: SplashViewModel? {
        didSet {
            /* Review: Estas coisas assim deviam estar numa funçao bindViewModel(_ viewModel: SplashViewModel) em vez de estar aqui tudo no didSet */
            guard let image = data?.image,
                  let title = data?.title,
                  let descriptionText = data?.description
            else { return }
            imageView.image = image
            mainLabel.text = title
            descriptionLabel.text = descriptionText
        }
    }
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 15
        iv.layer.masksToBounds = true
        return iv
    }()
    
    lazy var mainLabel: UILabel = {
        let ml = UILabel()
        return ml
    }()
    
    lazy var descriptionLabel: UILabel = {
        let dl = UILabel()
        return dl
    }()
    
    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.white
        view.addSubview(imageView)
        view.addSubview(mainLabel)
        view.addSubview(descriptionLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}
