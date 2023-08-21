//
//  MostActiveStock.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/20/23.
//

import Foundation

// MARK: - Most Active Stocks ( This will scan for highest volume)
struct MostActiveStock: Codable {
    let source: String
    let start, count, total: Int
    let description: String
    let quotes: [Quote]
}

// MARK: - Quote
struct Quote: Codable {
    let symbol: String
    let displayName: String
}
