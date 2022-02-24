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
}
