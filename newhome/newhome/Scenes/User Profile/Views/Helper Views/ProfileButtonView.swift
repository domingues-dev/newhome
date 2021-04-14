//
//  ProfileButton.swift
//  newhome
//
//  Created by Nicolá Domingues on 10/04/2021.
//

import UIKit

class ProfileButtonView: UIControl {
    
    // MARK: - Properties
    
    let iconWidth: CGFloat = 75
    let stackViewSpacing: CGFloat = 50
    let cornerRadius: CGFloat = 10
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = stackViewSpacing
        return sv
    }()
    
    lazy var icon: IconImageView = {
        let iv = IconImageView()
        iv.layer.cornerRadius = cornerRadius
        iv.tintColor = AppColors.blue
        return iv
    }()
    
    lazy var label: UILabel = {
        let l = UILabel()
        return l
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = cornerRadius
        setupSubViews()
        setupSubViewsLayouts()
    }
    
    fileprivate func setupSubViews() {
        
        addSubview(stackView)
        stackView.addArrangedSubview(icon)
        stackView.addArrangedSubview(label)
        icon.iconImageView.tintColor = AppColors.blue
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestures(_:)))
        addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    fileprivate func setupSubViewsLayouts() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: iconWidth),
            icon.heightAnchor.constraint(equalToConstant: iconWidth)
        ])
    }
    
    @objc func handleTapGestures(_ sender: Any) {
        sendActions(for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
