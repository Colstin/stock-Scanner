//
//  FullStockData.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 10/19/23.
//

import Foundation

struct FullStockData {
    let symbol: String
    let companyName: String
    let price: Double
    let volume: Int
    let changesPercentage: Double
    let change: Double
    
    var formattedPrice: String {
       return String(format: "%.2f", price)
   }
    
    var formattedChangesPercentage: String {
        return String(format: "%.1f", changesPercentage)
    }
    
    var formattedVolume: String {
        if volume >= 1_000_000_000 {
            return String(format: "%.2fB", Double(volume) / 1_000_000_000.0 )
        } else if volume >= 100_000_000 {
            return String(format: "%.0fM", Double(volume) / 1_000_000.0 )
        } else if volume >= 10_000_000 {
            return String(format: "%.1fM", Double(volume) / 1_000_000.0 )
        } else if volume >= 1_000_000 {
            return String(format: "%.2fM", Double(volume) / 1_000_000.0 )
        } else {
            return "\(volume / 1_000)K"
        }
    }
    
    
}
