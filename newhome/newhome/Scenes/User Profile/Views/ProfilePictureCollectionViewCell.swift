//
//  ProfilePictureCollectionViewCell.swift
//  newhome
//
//  Created by Nicolá Domingues on 09/04/2021.
//

import UIKit

class ProfilePictureCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    struct Constants  {
        static let profileSize: CGFloat = 180
        static let profileImageSize:CGFloat = 130
        static let profileImageBorderWidth:CGFloat = 5
        static let stackViewSpacing:CGFloat = 20
        static let profileImageButtonsSize: CGFloat = 40
        static let fontSize: CGFloat = 20
        static let profileImageCornerRadius: CGFloat = 45
    }
    
    lazy var profileVStackView: UIStackView = {
        let vsv = UIStackView()
        vsv.axis = .vertical
        vsv.alignment = .center
        vsv.distribution = .equalSpacing
        vsv.translatesAutoresizingMaskIntoConstraints = false
        return vsv
    }()
    
    
    lazy var profileHStackView: UIStackView = {
        let hsv = UIStackView()
        hsv.axis = .horizontal
        hsv.alignment = .center
        hsv.distribution = .equalSpacing
        hsv.spacing = Constants.stackViewSpacing
        return hsv
    }()
    
    lazy var cameraButton: SquareButton = {
        let cb = SquareButton()
        cb.addTarget(self, action: #selector(cameraButtonClicked(_:)), for: .touchUpInside)
        cb.setImage(AppProfileIcons.cameraIcon, for: .normal)
        return cb
    }()
    
    lazy var settings: SquareButton = {
        let cb = SquareButton()
        cb.addTarget(self, action: #selector(settingsButtonClicked(_:)), for: .touchUpInside)
        cb.setImage(AppProfileIcons.settingsIcon, for: .normal)
        return cb
    }()
    
    lazy var profileImageView: ProfileImage = {
       let piv = ProfileImage()
        piv.imageView.image = UIImage(named: "profile-picture")
        piv.imageView.layer.masksToBounds = true
        piv.imageView.layer.cornerRadius = Constants.profileImageCornerRadius
        piv.layer.cornerRadius = (Constants.profileImageSize / 2)
        piv.imageView.backgroundColor = AppColors.lightBlue
        piv.imageView.tintColor = AppColors.blue
        return piv
    }()
    
    lazy var profileName: UILabel = {
        let pn = UILabel()
        pn.text = "Matt Cummings"
        pn.textColor = AppColors.darkBlue
        pn.font = UIFont(name: "Lato-Bold", size: Constants.fontSize)
        return pn
    }()
    
    
    //MARK: - Initialization
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileVStackView)
        
        profileVStackView.addArrangedSubview(profileHStackView)
        profileVStackView.addArrangedSubview(profileName)
        profileHStackView.addArrangedSubview(cameraButton)
        profileHStackView.addArrangedSubview(profileImageView)
        profileHStackView.addArrangedSubview(settings)
        setupViewsLayout()
        
    }
    
    fileprivate func setupViewsLayout() {
        NSLayoutConstraint.activate([
            profileVStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            profileVStackView.heightAnchor.constraint(equalToConstant: Constants.profileSize),
            profileVStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileVStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: Constants.profileImageSize),
            profileImageView.heightAnchor.constraint(equalToConstant: Constants.profileImageSize)
        ])
        
        NSLayoutConstraint.activate([
            cameraButton.heightAnchor.constraint(equalToConstant: Constants.profileImageButtonsSize),
            cameraButton.widthAnchor.constraint(equalToConstant: Constants.profileImageButtonsSize)
        ])
        
        NSLayoutConstraint.activate([
            settings.heightAnchor.constraint(equalToConstant: Constants.profileImageButtonsSize),
            settings.widthAnchor.constraint(equalToConstant: Constants.profileImageButtonsSize)
        ])
    }

    
    //MARK: - Buttons Actions
    
    
    @objc private func cameraButtonClicked(_ sender: Any) {
        //TODO
    }
    
    @objc private func settingsButtonClicked(_ sender: Any) {
        //TODO
    }
    
}
