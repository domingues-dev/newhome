//
//  HeaderSectionSupplementaryCell.swift
//  newhome
//
//  Created by Nicolá Domingues on 26/04/2021.
//

import UIKit

class HeaderSectionSupplementaryCell: UICollectionReusableView {
    
    // MARK: - Properties
    
    var categorySection: CategorySectionViewModel? {
        didSet {
            guard let title = categorySection?.title else { return }
            titleLabel.text = title
        }
    }
    
    var minimalistSection: MinimalistSectionViewModel? {
        didSet {
            guard let title = minimalistSection?.title else { return }
            titleLabel.text = title
        }
    }
    
    lazy var titleLabel: UILabel = {
       let tl = UILabel()
        tl.font = UIFont(name: "Lato-Bold", size: 20) ?? .boldSystemFont(ofSize: 20)
        return tl
    }()
    
    lazy var seeMoreLabel: UILabel = {
        let ml = UILabel()
        ml.textColor = AppColors.blue
        ml.font = UIFont(name: "Lato", size: 16) ?? .systemFont(ofSize: 16)
        ml.text = "See More"
        return ml
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(seeMoreLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            titleLabel.widthAnchor.constraint(equalToConstant: self.bounds.width - 100)
        ])
        
        seeMoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            seeMoreLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            seeMoreLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            seeMoreLabel.widthAnchor.constraint(equalToConstant: 100),
            seeMoreLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
