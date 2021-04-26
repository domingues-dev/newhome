//
//  CategoryViewCell.swift
//  newhome
//
//  Created by Nicolá Domingues on 26/04/2021.
//

import UIKit

class CategoryViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var category: CategoryViewModel? {
        didSet {
            guard let image = category?.image,
                  let label = category?.label
            else { return }
            imageView.image = image
            self.label.text = label
        }
    }
    
    lazy var imageView: UIImageView = {
       let iv = UIImageView()
        iv.layer.cornerRadius = 10
        iv.layer.masksToBounds = true
        return iv
    }()
    
    lazy var label: UILabel = {
        let l = UILabel()
        l.textColor = AppColors.white
        l.numberOfLines = 1
        l.font = UIFont(name: "Lato-Bold", size: 20) ?? .boldSystemFont(ofSize: 20)
        return l
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(label)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 10),
            label.widthAnchor.constraint(equalToConstant: self.bounds.width),
            label.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            label.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
