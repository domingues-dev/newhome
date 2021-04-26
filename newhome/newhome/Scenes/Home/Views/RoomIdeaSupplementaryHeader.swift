//
//  RoomIdeaSupplementaryHeader.swift
//  newhome
//
//  Created by Nicolá Domingues on 23/04/2021.
//

import UIKit

class RoomIdeaSupplementaryHeader: UICollectionReusableView {
    
    var section: RoomIdeasSectionViewModel? {
        didSet {
            guard let title = section?.title else { return }
            label.text = title
        }
    }
    
    lazy var label: UILabel = {
       let l = UILabel()
        l.font = UIFont(name: "Lato-Bold", size: 20) ?? .boldSystemFont(ofSize: 20)
        l.numberOfLines = 2
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            label.heightAnchor.constraint(equalToConstant: 60),
            label.widthAnchor.constraint(equalToConstant: (self.bounds.width * 3 / 5)),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
