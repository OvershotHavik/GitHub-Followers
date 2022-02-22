//
//  FollowerCell.swift
//  GitHub Followers
//
//  Created by Steve Plavetzky on 2/22/22.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"
    let avatarIV = GFAvatarImageView(frame: .zero)
    let userNameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(follower: Follower){
        userNameLabel.text = follower.login
        
    }
    
    private func configure(){
        addSubview(avatarIV)
        addSubview(userNameLabel)
        
        let padding: CGFloat = 8
        NSLayoutConstraint.activate([
            avatarIV.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarIV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarIV.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarIV.heightAnchor.constraint(equalTo: avatarIV.widthAnchor),
            
            userNameLabel.topAnchor.constraint(equalTo: avatarIV.bottomAnchor, constant: 12),
            userNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            userNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
