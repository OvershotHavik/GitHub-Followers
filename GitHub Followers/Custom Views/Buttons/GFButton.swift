//
//  GFButton.swift
//  GitHub Followers
//
//  Created by Steve Plavetzky on 2/22/22.
//

import UIKit

class GFButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(backgroundColor: UIColor, title: String){
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
    
    
    private func configure(){
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal) // is white by default, but can be changed here normally
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func set(backgroundColor: UIColor, title: String){
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
    }
}
