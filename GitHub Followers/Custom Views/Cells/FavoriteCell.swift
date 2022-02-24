//
//  FavoriteCell.swift
//  GitHub Followers
//
//  Created by Steve Plavetzky on 2/23/22.
//

import UIKit

class FavoriteCell: UITableViewCell {
    static let reuseID = "FavoriteCell"
    let avatarIV = GFAvatarImageView(frame: .zero)
    let userNameLabel = GFTitleLabel(textAlignment: .left, fontSize: 26)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(favorite: Follower){
        userNameLabel.text = favorite.login
        avatarIV.downloadImage(from: favorite.avatarUrl)
    }
    
    
    private func configure(){
        addSubviews(avatarIV, userNameLabel)
        
        accessoryType = .disclosureIndicator
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            avatarIV.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarIV.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            avatarIV.heightAnchor.constraint(equalToConstant: 60),
            avatarIV.widthAnchor.constraint(equalToConstant: 60),
            
            userNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: avatarIV.trailingAnchor, constant: 24),
            userNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            userNameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
}
