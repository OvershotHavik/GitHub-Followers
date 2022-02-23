//
//  GFUserInfoHeaderVC.swift
//  GitHub Followers
//
//  Created by Steve Plavetzky on 2/23/22.
//

import UIKit

class GFUserInfoHeaderVC: UIViewController {

    let avatarIV = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    let locationIV = UIImageView()
    let locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    let bioLabel = GFBodyLabel(textAlignment: .left)
    
    var user: User!
    
    init(user: User){
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUIElements(){
        avatarIV.downloadImage(from: user.avatarUrl)
        usernameLabel.text = user.login
        nameLabel.text = user.name ?? ""
        locationLabel.text = user.location ?? "No location"
        bioLabel.text = user.bio
        bioLabel.numberOfLines = 3
        
        locationIV.image = UIImage(systemName: SFSymbols.location)
        locationIV.tintColor = .secondaryLabel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubViews()
        setupConstraints()
        configureUIElements()
    }
    
    
    func addSubViews(){
        view.addSubview(avatarIV)
        view.addSubview(usernameLabel)
        view.addSubview(nameLabel)
        view.addSubview(locationIV)
        locationIV.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(locationLabel)
        view.addSubview(bioLabel)
    }
    
    func setupConstraints(){
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12
        
        
        NSLayoutConstraint.activate([
            avatarIV.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarIV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarIV.heightAnchor.constraint(equalToConstant: 110),
            avatarIV.widthAnchor.constraint(equalToConstant: 110),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarIV.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarIV.trailingAnchor, constant: textImagePadding),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 38),
            
            nameLabel.centerYAnchor.constraint(equalTo: avatarIV.centerYAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: avatarIV.trailingAnchor, constant: textImagePadding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            locationIV.bottomAnchor.constraint(equalTo: avatarIV.bottomAnchor),
            locationIV.leadingAnchor.constraint(equalTo: avatarIV.trailingAnchor, constant: textImagePadding),
            locationIV.heightAnchor.constraint(equalToConstant: 20),
            locationIV.widthAnchor.constraint(equalToConstant: 20),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationIV.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationIV.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),

            bioLabel.topAnchor.constraint(equalTo: avatarIV.bottomAnchor, constant: textImagePadding),
            bioLabel.leadingAnchor.constraint(equalTo: avatarIV.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bioLabel.heightAnchor.constraint(equalToConstant: 60)
            
        ])
        
    }
}
