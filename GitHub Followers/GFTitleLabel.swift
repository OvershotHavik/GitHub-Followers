//
//  GFTitleLabel.swift
//  GitHub Followers
//
//  Created by Steve Plavetzky on 2/22/22.
//

import UIKit

class GFTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat){
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configuration()
    }

    
    private func configuration(){
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        
    }
}
