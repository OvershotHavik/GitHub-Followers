//
//  GFEmptyStateView.swift
//  GitHub Followers
//
//  Created by Steve Plavetzky on 2/23/22.
//

import UIKit

class GFEmptyStateView: UIView {
    let messageLabel = GFTitleLabel(textAlignment: .center, fontSize: 28)
    let logoIV = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureMessageLabel()
        configureLogoIV()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(message: String){
        self.init(frame: .zero)
        messageLabel.text = message
    }
    
    
    private func configureLogoIV(){
        addSubview(logoIV)
        logoIV.translatesAutoresizingMaskIntoConstraints = false
        logoIV.image = Images.emptyStateLogo
        
        let logoBottomConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? -140 : 40
        let logoIVBottomConstraint = logoIV.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: logoBottomConstant)
        logoIVBottomConstraint.isActive = true
        
        
        NSLayoutConstraint.activate([
            logoIV.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoIV.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoIV.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 200),
        ])
    }
    
    
    private func configureMessageLabel(){
        addSubview(messageLabel)
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        let labelCenterYConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? -50 : -150
        let messageLabelCenterYConstraint = messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: labelCenterYConstant)
        messageLabelCenterYConstraint.isActive = true
        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            messageLabel.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
}
