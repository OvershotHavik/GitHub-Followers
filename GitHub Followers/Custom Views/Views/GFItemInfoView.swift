//
//  GFItemInfoView.swift
//  GitHub Followers
//
//  Created by Steve Plavetzky on 2/23/22.
//

import UIKit

enum ItemInfoType {
    case repos, gists, followers, following
}

class GFItemInfoView: UIView {
    let symbolIV = UIImageView()
    let titleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = GFTitleLabel(textAlignment: .center, fontSize: 14)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure(){
        addSubviews(symbolIV, titleLabel, countLabel)
        symbolIV.translatesAutoresizingMaskIntoConstraints = false
        symbolIV.contentMode = .scaleAspectFill
        symbolIV.tintColor = .label
        
        NSLayoutConstraint.activate([
            symbolIV.topAnchor.constraint(equalTo: self.topAnchor),
            symbolIV.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolIV.heightAnchor.constraint(equalToConstant: 20),
            symbolIV.widthAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: symbolIV.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolIV.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symbolIV.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    
    func set(itemInfoType: ItemInfoType, withCount count: Int){
        switch itemInfoType {
        case .repos:
            symbolIV.image = SFSymbols.repos
            titleLabel.text = "Public Repos"
        case .gists:
            symbolIV.image = SFSymbols.gists
            titleLabel.text = "Public Gists"
        case .followers:
            symbolIV.image = SFSymbols.followers
            titleLabel.text = "Followers"
        case .following:
            symbolIV.image = SFSymbols.following
            titleLabel.text = "Following"
        }
        countLabel.text = "\(count)"
    }
}
