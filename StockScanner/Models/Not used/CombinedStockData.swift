//
//  CombinedStockData.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/22/23.
//

import Foundation

struct CombinedStockData: Identifiable {
    let id = UUID()
    let symbol: String
    let stockQuote: StockQuote?
}
