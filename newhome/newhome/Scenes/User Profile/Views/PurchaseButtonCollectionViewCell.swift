//
//  PurchaseButtonCollectionViewCell.swift
//  newhome
//
//  Created by Nicolá Domingues on 12/04/2021.
//

import UIKit

class PurchaseButtonCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    let fontSize: CGFloat = 20
    let buttonMargin: CGFloat = 20
    
    lazy var purchaseButton: ProfileButtonView = {
        let sb = ProfileButtonView()
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.icon.iconImageView.image = AppProfileIcons.purchaseIcon
        sb.label.text = "My Purchases"
        sb.label.font = UIFont(name: "Lato-Bold", size: fontSize) ?? .boldSystemFont(ofSize: fontSize)
        sb.label.textColor = AppColors.blue
        return sb
    }()
    
    //MARK: - Initialization
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(purchaseButton)
        
        NSLayoutConstraint.activate([
            purchaseButton.topAnchor.constraint(equalTo: self.topAnchor),
            purchaseButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            purchaseButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: buttonMargin),
            purchaseButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -buttonMargin),

        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
