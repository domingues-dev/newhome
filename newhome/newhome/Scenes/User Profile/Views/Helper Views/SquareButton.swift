//
//  SquareButton.swift
//  newhome
//
//  Created by Nicolá Domingues on 08/04/2021.
//

import UIKit


class SquareButton: UIButton {
    
    //MARK: - Properties
    
    let cornerRadius: CGFloat = 10
    let size: CGFloat = 40
    
    //MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    fileprivate func setupButton() {
        backgroundColor = AppColors.lightBlue
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: size),
            self.heightAnchor.constraint(equalToConstant: size)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
        fatalError("init(coder:) has not been implemented")
    }
}
