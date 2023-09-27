//
//  StockScreener.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/25/23.
//

import Foundation

struct StockScreener: Codable {
    let symbol: String
    let companyName: String
    let price: Double
    let volume: Int
    let exchangeShortName: String
    
    var formattedPrice: String {
       return String(format: "%.2f", price)
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





/*
[
    {
        "symbol" : "MSFT",
        "companyName" : "Microsoft Corporation",
        "marketCap" : 1391637040000,
        "sector" : "Technology",
        "beta" : 1.2310280000000000111270992420031689107418060302734375,
        "price" : 183.509999999999990905052982270717620849609375,
        "lastAnnualDividend" : 1.939999999999999946709294817992486059665679931640625,
        "volume" : 54536583,
        "exchange" : "Nasdaq Global Select",
        "exchangeShortName" : "NASDAQ"
    },
    {
        "symbol" : "AMZN",
        "companyName" : "Amazon.com Inc.",
        "marketCap" : 1215457260000,
        "sector" : "Technology",
        "beta" : 1.5168630000000000723758830645238049328327178955078125,
        "price" : 2436.8800000000001091393642127513885498046875,
        "lastAnnualDividend" : 0,
        "volume" : 6105985,
        "exchange" : "Nasdaq Global Select",
        "exchangeShortName" : "NASDAQ"
    }
]
*/
