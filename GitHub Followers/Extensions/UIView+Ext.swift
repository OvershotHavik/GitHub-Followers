//
//  UIView+Ext.swift
//  GitHub Followers
//
//  Created by Steve Plavetzky on 2/24/22.
//

import UIKit

extension UIView{
    func addSubviews(_ views: UIView...){
        for view in views{
            addSubview(view)
        }
    }
    
    
    func pinToEdges(of superView: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }
}
