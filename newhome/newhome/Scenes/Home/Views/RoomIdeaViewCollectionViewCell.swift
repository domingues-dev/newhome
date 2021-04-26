//
//  RoomIdeaView.swift
//  newhome
//
//  Created by Nicolá Domingues on 20/04/2021.
//

import UIKit

class RoomIdeaCollectionViewCell: UICollectionViewCell {
    
    var roomIdea: RoomIdeaViewModel? {
        didSet {
            guard let image = roomIdea?.image,
                  let label = roomIdea?.label else {
                return
            }
            imageView.image = image
            self.label.text = label
        }
    }
    
    lazy var label: UILabel = {
        let l = UILabel()
        l.textColor = AppColors.white
        l.numberOfLines = 2
        l.font = UIFont(name: "Lato-Bold", size: 20) ?? .boldSystemFont(ofSize: 20)
        return l
    }()
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 15
        iv.layer.masksToBounds = true
        return iv
    }()
    
    lazy var button: FavoriteButton = {
        let btn = FavoriteButton()
        btn.addTarget(self, action: #selector(addToFavorites(_:)), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = AppColors.white
        addSubview(imageView)
        addSubview(label)
        addSubview(button)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            label.widthAnchor.constraint(equalToConstant: (self.bounds.width / 2) + 40)
        ])
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10),
            button.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10),
            button.widthAnchor.constraint(equalToConstant: 40),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addToFavorites(_ sender: Any) {
        button.isHighlighted.toggle()
    }
}
