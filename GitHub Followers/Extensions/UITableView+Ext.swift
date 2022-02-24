//
//  UITableView+Ext.swift
//  GitHub Followers
//
//  Created by Steve Plavetzky on 2/24/22.
//

import UIKit

extension UITableView{
    func reloadDataOnMainThread(){
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    func removeExcessCells(){
        tableFooterView = UIView(frame: .zero)
    }
}

