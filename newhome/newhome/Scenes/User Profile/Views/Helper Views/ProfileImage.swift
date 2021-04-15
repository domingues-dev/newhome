//
//  ProfileImage.swift
//  newhome
//
//  Created by Nicolá Domingues on 11/04/2021.
//

import UIKit

class ProfileImage: UIView {
    
    // MARK: - Properties
    
    let borderWidth: CGFloat = 5
    let imageMargin: CGFloat = 20
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.masksToBounds = true
        return iv
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = AppColors.white
        layer.borderColor = AppColors.blue.cgColor
        layer.borderWidth = borderWidth
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: imageMargin),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -imageMargin),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: imageMargin),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -imageMargin)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
