//
//  ChoiceCollectionViewCell.swift
//  newhome
//
//  Created by Nicolá Domingues on 26/04/2021.
//

import UIKit

class ChoiceCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var choice: MinimalistViewModel? {
        didSet {
            guard let image = choice?.image,
                  let product = choice?.label,
                  let type = choice?.type,
                  let price = choice?.price
                  else { return }
            imageView.image = image
            productLabel.text = product
            typeLabel.text = type
            priceLabel.text = "$ \(price)"
        }
    }
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 10
        iv.layer.masksToBounds = true
        return iv
    }()
    
    lazy var productLabel: UILabel = {
        let pl = UILabel()
        pl.numberOfLines = 1
        pl.font = UIFont(name: "Lato-Bold", size: 16) ?? .boldSystemFont(ofSize: 16)
        pl.textColor = AppColors.black
        return pl
    }()
    
    lazy var typeLabel: UILabel = {
        let tl = UILabel()
        tl.numberOfLines = 1
        tl.font = UIFont(name: "Lato-Light", size: 16) ?? .systemFont(ofSize: 16)
        tl.textColor = AppColors.black
        return tl
    }()
    
    lazy var priceLabel: UILabel = {
        let pl = UILabel()
        pl.numberOfLines = 1
        pl.font = UIFont(name: "Lato-Bold", size: 16) ?? .boldSystemFont(ofSize: 16)
        pl.textColor = AppColors.darkBlue
        return pl
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(productLabel)
        addSubview(typeLabel)
        addSubview(priceLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            imageView.widthAnchor.constraint(equalToConstant: 80)
            
        ])
        
        productLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            productLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            productLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
        
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: 10),
            typeLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            typeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
