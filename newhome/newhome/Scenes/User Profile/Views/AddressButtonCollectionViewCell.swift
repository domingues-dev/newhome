//
//  AddressButtonCollectionViewCell.swift
//  newhome
//
//  Created by Nicolá Domingues on 13/04/2021.
//

import UIKit

class AddressButtonCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    let fontSize: CGFloat = 20
    let buttonMargin: CGFloat = 20
    
    lazy var addressButtonView: ProfileButtonView = {
        let sb = ProfileButtonView()
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.icon.iconImageView.image = AppProfileIcons.addressIcon
        sb.label.text = "Addesses Book"
        sb.label.font = UIFont(name: "Lato-Bold", size: fontSize) ?? .boldSystemFont(ofSize: fontSize)
        sb.label.textColor = AppColors.blue
        return sb
    }()
    
    //MARK: - Initialization
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(addressButtonView)
        
        NSLayoutConstraint.activate([
            addressButtonView.topAnchor.constraint(equalTo: self.topAnchor),
            addressButtonView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            addressButtonView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: buttonMargin),
            addressButtonView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -buttonMargin),

        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
