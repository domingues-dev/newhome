//
//  IconImageView.swift
//  newhome
//
//  Created by Nicolá Domingues on 11/04/2021.
//

import UIKit

class IconImageView: UIView {
    
    
    //MARK: - Properties
    
    let imageMargin: CGFloat = 20
    
    lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    //MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: imageMargin),
            iconImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -imageMargin),
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: imageMargin),
            iconImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -imageMargin),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
