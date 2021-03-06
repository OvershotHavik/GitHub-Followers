//
//  GFAvatarImageView.swift
//  GitHub Followers
//
//  Created by Steve Plavetzky on 2/22/22.
//

import UIKit

class GFAvatarImageView: UIImageView {
    let placeHolderImage = Images.placeHolder
    let cache = NetworkManager.shared.cache
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeHolderImage
    }
    
    
    func downloadImage(from urlString: String){
        Task {
            image = await NetworkManager.shared.downloadImage(from: urlString) ?? placeHolderImage
        }
    }
}
