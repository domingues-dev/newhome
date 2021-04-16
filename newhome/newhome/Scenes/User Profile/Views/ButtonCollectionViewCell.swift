//
//  PurchaseButtonCollectionViewCell.swift
//  newhome
//
//  Created by Nicolá Domingues on 12/04/2021.
//

import UIKit

class ButtonCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var model: ButtonViewModel? {
        didSet {
            guard let image = model?.image,
                  let label = model?.name
            else { return }
            button.icon.iconImageView.image = image
            button.label.text = label
        }
    }
    
    enum Constants {
        static let fontSize: CGFloat = 20
        static let buttonMargin: CGFloat = 20
    }

    var buttonProperties: ButtonViewModel? {
        didSet {
            button.icon.iconImageView.image = buttonProperties?.image
            button.label.text = buttonProperties?.name
        }
    }
    
    lazy var button: ProfileButtonView = {
        let sb = ProfileButtonView()
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.label.font = UIFont(
            name: "Lato-Bold",
            size: Constants.fontSize) ?? .boldSystemFont(ofSize: Constants.fontSize)
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
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.buttonMargin),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.buttonMargin)

        ])
    }
    
    @objc func buttonClicked(_ sender: Any) {
        button.isHighlighted.toggle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
