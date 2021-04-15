//
//  PurchaseButtonCollectionViewCell.swift
//  newhome
//
//  Created by Nicolá Domingues on 12/04/2021.
//

import UIKit

class ButtonCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let fontSize: CGFloat = 20
    let buttonMargin: CGFloat = 20
    
    var buttonProperties: Button? {
        didSet {
            button.icon.iconImageView.image = buttonProperties?.image
            button.label.text = buttonProperties?.name
        }
    }
    
    lazy var button: ProfileButtonView = {
        let sb = ProfileButtonView()
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.label.font = UIFont(name: "Lato-Bold", size: fontSize) ?? .boldSystemFont(ofSize: fontSize)
        sb.label.textColor = AppColors.blue
        sb.backgroundColor = AppColors.lightGrey
        return sb
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(button)
        button.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: buttonMargin),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -buttonMargin)

        ])
    }
    
    @objc func buttonClicked(_ sender: Any) {
        button.isSelected = !button.isSelected
        /*
         Review: you could override UIButton isSelected.. to reutilize the code
         Something like this inside ProfileButtonView class
         
         override var isSelected: Bool {
            didSet {
                if isSelected {
                    button.backgroundColor = AppColors.blue
                    button.icon.iconImageView.tintColor = AppColors.white
                    button.label.textColor = AppColors.white
                } else {
                    button.backgroundColor = AppColors.lightGrey
                    button.icon.iconImageView.tintColor = AppColors.blue
                    button.label.textColor = AppColors.blue
                }
            }
         }
         
         I know that this is just for testing, but usually we don't want to make buttons selected..
         We override the `isHighlighted` property instead to help the user know that we are interacting with the button
         */
        if button.isSelected {
            button.backgroundColor = AppColors.blue
            button.icon.iconImageView.tintColor = AppColors.white
            button.label.textColor = AppColors.white
        } else {
            button.backgroundColor = AppColors.lightGrey
            button.icon.iconImageView.tintColor = AppColors.blue
            button.label.textColor = AppColors.blue
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
