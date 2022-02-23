//
//  Date+Ext.swift
//  GitHub Followers
//
//  Created by Steve Plavetzky on 2/23/22.
//

import Foundation

extension Date{
    
    func convertToMonthYearFormat() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM, yyyy"
        return dateFormatter.string(from: self)
    }
}
