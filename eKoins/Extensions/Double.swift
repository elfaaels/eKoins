//
//  Double.swift
//  eKoins
//
//  Created by Elfana Anamta Chatya on 25/07/24.
//

import Foundation

extension Double {
    
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current // Default value
//        formatter.currencyCode = "usd" // Change currency
//        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
        
    }
    
//    func asCurrencyWith6Decimals() -> String {
//        let number = NSNumber(value: self)
//        return currencyFormatter6.string(from: number) ?? "$0.00"
//    }
//    
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    // Convert Double into String representation
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}
