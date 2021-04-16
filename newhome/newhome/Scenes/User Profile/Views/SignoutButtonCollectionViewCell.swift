//
//  ProfileButtonsCollectionViewCell.swift
//  newhome
//
//  Created by Nicolá Domingues on 09/04/2021.
//

import UIKit

class SignoutButtonCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    var model: AuthButtonViewModel? {
        didSet {
            guard let image = model?.image,
                  let label = model?.name
                  else { return }
            signoutButton.icon.iconImageView.image = image
            signoutButton.label.text = label
        }
    }
    
    private let buttonMargin: CGFloat = 20
    
    lazy var signoutButton: SignoutButtonView = {
        let sb = SignoutButtonView()
        sb.translatesAutoresizingMaskIntoConstraints = false
        return sb
    }()
    
    // MARK: - Initialization
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(signoutButton)
        signoutButton.addTarget(self, action: #selector(clicked(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            signoutButton.topAnchor.constraint(equalTo: self.topAnchor),
            signoutButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            signoutButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: buttonMargin),
            signoutButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -buttonMargin)
        ])
    }

    @objc func clicked(_ sender: Any?) {
        print(123)
    }
}
