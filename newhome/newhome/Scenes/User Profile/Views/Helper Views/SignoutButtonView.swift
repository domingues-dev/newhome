//
//  SignoutButton.swift
//  newhome
//
//  Created by Nicolá Domingues on 08/04/2021.
//

import UIKit

class SignoutButtonView: UIControl {
    
    // MARK: - Properties
    
    let iconWidth: CGFloat = 75
    let stackViewSpacing: CGFloat = 50
    let cornerRadius: CGFloat = 10
    let fontSize: CGFloat = 20
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = stackViewSpacing
        return sv
    }()
    
    lazy var icon: IconImageView = {
        let iv = IconImageView()
        iv.iconImageView.image = AppProfileIcons.signoutIcon
        iv.backgroundColor = AppColors.darkBlue
        iv.tintColor = AppColors.white
        iv.layer.cornerRadius = cornerRadius
        return iv
    }()
    
    lazy var label: UILabel = {
        let l = UILabel()
        l.attributedText = NSAttributedString(
            string: "Signout",
            attributes: [
                NSAttributedString.Key.font: UIFont(
                    name: "Lato-Bold",
                    size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize)])
        return l
    }()
    
    fileprivate func setupSubViews() {
        
        backgroundColor = AppColors.white
        tintColor = AppColors.darkBlue
        addSubview(stackView)
        stackView.addArrangedSubview(icon)
        stackView.addArrangedSubview(label)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTouchUpInside))
        addGestureRecognizer(tapGesture)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: iconWidth)
        ])
    }
    
    @objc func onTouchUpInside(_ sender: Any) {
        sendActions(for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
