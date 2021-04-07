//
//  ProfileViewController.swift
//  newhome
//
//  Created by Nicolá Domingues on 07/04/2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK - Properties
    
    var presenter: ProfilePresenterProtocol!
    
    struct Constants  {
        static let profileSize: CGFloat = 180
        static let profileImageSize:CGFloat = 140
        static let profileImageBorderWidth:CGFloat = 5
        static let stackViewSpacing:CGFloat = 20
        static let profileImageButtonsSize: CGFloat = 40
        static let buttonCornerRadius: CGFloat = 10
        static let stackViewsHorizontalMargin: CGFloat = 30
        static let stackViewsVerticalMargin: CGFloat = 60
        static let signoutButtonSize: CGFloat = 80
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
    
    lazy var cameraButton: UIButton = {
       let cb = UIButton()
        cb.addTarget(self, action: #selector(cameraButtonClicked(_:)), for: .touchUpInside)
        cb.backgroundColor = UIColor(named: "light-blue")
        cb.setImage(UIImage(named: "camera-icon"), for: .normal)
        cb.layer.cornerRadius = Constants.buttonCornerRadius
        cb.layer.masksToBounds = true
        cb.translatesAutoresizingMaskIntoConstraints = false
        return cb
    }()
    
    lazy var settings: UIButton = {
       let cb = UIButton()
        cb.addTarget(self, action: #selector(settingsButtonClicked(_:)), for: .touchUpInside)
        cb.backgroundColor = UIColor(named: "light-blue")
        cb.setImage(UIImage(named: "settings-icon"), for: .normal)
        cb.layer.cornerRadius = Constants.buttonCornerRadius
        cb.translatesAutoresizingMaskIntoConstraints = false
        return cb
    }()
    
    lazy var profileImageView: UIImageView = {
        let piv = UIImageView()
        piv.image = UIImage(named: "profile-icon")
        piv.layer.cornerRadius = (Constants.profileImageSize ) / 2
        piv.layer.borderWidth = Constants.profileImageBorderWidth
        piv.layer.borderColor = UIColor(named: "blue")?.cgColor
        piv.layer.masksToBounds = true
        return piv
    }()
    
    lazy var profileName: UILabel = {
       let pn = UILabel()
        pn.text = "Matt Cummings"
        pn.textColor = UIColor(named: "dark-blue")
        pn.font = UIFont(name: "Lato-Bold", size: 20)
        return pn
    }()
    
    lazy var buttonsHStackView: UIStackView = {
       let bhsv = UIStackView()
        bhsv.axis = .vertical
        bhsv.spacing = Constants.stackViewSpacing
        bhsv.alignment = .fill
        bhsv.distribution = .fillEqually
        bhsv.translatesAutoresizingMaskIntoConstraints = false
        return bhsv
    }()
    
    lazy var purchasesButton: UIButton = {
       let cb = UIButton()
        cb.addTarget(self, action: #selector(purchaseButtonClicked(_:)), for: .touchUpInside)
        cb.setTitleColor(.white, for: .normal)
        cb.setImage(UIImage(named: "purchase-icon"), for: .normal)
        cb.tintColor = UIColor.white
        cb.setAttributedTitle(NSAttributedString(string: "My purchases", attributes: [NSAttributedString.Key.font: UIFont(name: "Lato", size: 20)!]), for: .normal)
        cb.imageEdgeInsets = UIEdgeInsets(top: 0, left: -150, bottom: 0, right: 0)
        cb.titleEdgeInsets = UIEdgeInsets(top: 0, left: -75, bottom: 0, right: 0)
        cb.layer.cornerRadius = Constants.buttonCornerRadius
        cb.layer.masksToBounds = true
        cb.backgroundColor = UIColor(named: "blue")
        cb.clipsToBounds = true
        cb.translatesAutoresizingMaskIntoConstraints = false
        return cb
    }()
    
    lazy var addressButton: UIButton = {
       let cb = UIButton()
        cb.addTarget(self, action: #selector(addressButtonClicked(_:)), for: .touchUpInside)
        cb.setTitleColor(UIColor(named: "blue"), for: .normal)
        cb.setImage(UIImage(named: "address-icon"), for: .normal)
        cb.tintColor = UIColor(named: "blue")
        cb.setAttributedTitle(NSAttributedString(string: "Address Book", attributes: [NSAttributedString.Key.font: UIFont(name: "Lato", size: 20)!]), for: .normal)
        cb.imageEdgeInsets = UIEdgeInsets(top: 0, left: -150, bottom: 0, right: 0)
        cb.titleEdgeInsets = UIEdgeInsets(top: 0, left: -75, bottom: 0, right: 0)
        cb.clipsToBounds = true
        cb.layer.cornerRadius = Constants.buttonCornerRadius
        cb.layer.masksToBounds = true
        cb.backgroundColor = UIColor(named: "light-grey")
        cb.translatesAutoresizingMaskIntoConstraints = false
        return cb
    }()
    
    lazy var walletButton: UIButton = {
       let cb = UIButton()
        cb.addTarget(self, action: #selector(walletButtonClicked(_:)), for: .touchUpInside)
        cb.setTitleColor(UIColor(named: "blue"), for: .normal)
        cb.setImage(UIImage(named: "wallet-icon"), for: .normal)
        cb.tintColor = UIColor(named: "blue")
        cb.setAttributedTitle(NSAttributedString(string: "My Wallet", attributes: [NSAttributedString.Key.font: UIFont(name: "Lato", size: 20)!]), for: .normal)
        cb.imageEdgeInsets = UIEdgeInsets(top: 0, left: -175, bottom: 0, right: 0)
        cb.titleEdgeInsets = UIEdgeInsets(top: 0, left: -100, bottom: 0, right: 0)
        cb.layer.cornerRadius = Constants.buttonCornerRadius
        cb.layer.masksToBounds = true
        cb.backgroundColor = UIColor(named: "light-grey")
        cb.clipsToBounds = true
        cb.translatesAutoresizingMaskIntoConstraints = false
        return cb
    }()
    
    lazy var signoutStackView: UIStackView = {
       let ssv = UIStackView()
        ssv.axis = .horizontal
        ssv.alignment = .fill
        ssv.spacing = 50
        ssv.clipsToBounds = true
        return ssv
    }()
    
    lazy var signoutButton: UIButton = {
        let sb = UIButton()
        sb.setImage(UIImage(named: "signout-icon"), for: .normal)
        sb.backgroundColor = UIColor(named: "dark-blue")
        sb.layer.cornerRadius = Constants.buttonCornerRadius
        sb.clipsToBounds = true
        sb.addTarget(self, action: #selector(signoutButtonClicked(_:)), for: .touchUpInside)
        return sb
    }()
    
    lazy var signoutLabel: UILabel = {
       let sl = UILabel()
        sl.text = "Sign out"
        return sl
    }()
    
    //MARK - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.viewDidLoad()
        addProfileStackView()
        addButtonsStackView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "cart-icon"), style: .plain, target: self, action: #selector(cartButtonClicked(_:)))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "dark-blue")
        setupLayoutProfileViews()
    }
    
    
    fileprivate func addProfileStackView() {
        view.addSubview(profileVStackView)
        profileVStackView.addArrangedSubview(profileHStackView)
        profileVStackView.addArrangedSubview(profileName)
        profileHStackView.addArrangedSubview(cameraButton)
        profileHStackView.addArrangedSubview(profileImageView)
        profileHStackView.addArrangedSubview(settings)
    }
    
    fileprivate func addButtonsStackView() {
        view.addSubview(buttonsHStackView)
        buttonsHStackView.addArrangedSubview(purchasesButton)
        buttonsHStackView.addArrangedSubview(addressButton)
        buttonsHStackView.addArrangedSubview(walletButton)
        buttonsHStackView.addArrangedSubview(signoutStackView)
        signoutStackView.addArrangedSubview(signoutButton)
        signoutStackView.addArrangedSubview(signoutLabel)
    }
    
    private func setupLayoutProfileViews() {
        
        NSLayoutConstraint.activate([
            profileVStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileVStackView.heightAnchor.constraint(equalToConstant: Constants.profileSize),
            profileVStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileVStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
  
            NSLayoutConstraint.activate([
                buttonsHStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.stackViewsVerticalMargin),
                buttonsHStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.stackViewsHorizontalMargin),
                buttonsHStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.stackViewsHorizontalMargin),
                buttonsHStackView.topAnchor.constraint(equalTo: profileVStackView.bottomAnchor, constant: Constants.stackViewsVerticalMargin)
            ])
        
        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalToConstant: Constants.profileImageSize),
            profileImageView.widthAnchor.constraint(equalToConstant: Constants.profileImageSize)
        ])
        
        NSLayoutConstraint.activate([
            cameraButton.heightAnchor.constraint(equalToConstant: Constants.profileImageButtonsSize),
            cameraButton.widthAnchor.constraint(equalToConstant: Constants.profileImageButtonsSize)
        ])
        
        NSLayoutConstraint.activate([
            settings.heightAnchor.constraint(equalToConstant: Constants.profileImageButtonsSize),
            settings.widthAnchor.constraint(equalToConstant: Constants.profileImageButtonsSize)
        ])
        
        
        NSLayoutConstraint.activate([
            signoutButton.widthAnchor.constraint(equalTo: signoutButton.heightAnchor),
        ])
    }
    
    //MARK: - Button Actions
    
    @objc private func cartButtonClicked(_ sender: Any) {
        //TODO
    }
    
    @objc private func cameraButtonClicked(_ sender: Any) {
        //TODO
    }
    
    @objc private func settingsButtonClicked(_ sender: Any) {
        //TODO
    }
    
    @objc private func purchaseButtonClicked(_ sender: Any) {
        //TODO
    }
    
    @objc private func addressButtonClicked(_ sender: Any) {
        //TODO
    }
    
    @objc private func walletButtonClicked(_ sender: Any) {
        //TODO
    }
    
    @objc private func signoutButtonClicked(_ sender: Any) {
        //TODO
    }
}

//MARK - ProfileViewProtocol

extension ProfileViewController: ProfileViewProtocol {
    func isLoading(_ loading: Bool) {
        
    }
    
    func updateTitle(_ title: String) {
        self.navigationItem.title = title
    }
}
