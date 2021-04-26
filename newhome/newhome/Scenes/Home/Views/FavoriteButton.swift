//
//  FavoriteButton.swift
//  newhome
//
//  Created by Nicolá Domingues on 23/04/2021.
//

import UIKit

class FavoriteButton: UIControl {
    
    // MARK: - Properties
    
    override var isHighlighted: Bool {
        didSet {
            if  isHighlighted {
                backgroundColor = AppColors.blue
                imageView.tintColor = AppColors.white
            } else {
                backgroundColor = AppColors.lightGrey
                imageView.tintColor = AppColors.black
            }
        }
    }
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = AppTabBarIcons.likedIcon
        iv.tintColor = AppColors.black
        return iv
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = AppColors.white
        addSubview(imageView)
        layer.cornerRadius = 10
        layer.masksToBounds = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestures(_:)))
        addGestureRecognizer(tapGestureRecognizer)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleTapGestures(_ sender: Any) {
        sendActions(for: .touchUpInside)
    }
}
