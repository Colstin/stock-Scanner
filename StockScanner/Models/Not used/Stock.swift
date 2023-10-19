//
//  Stock.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/3/23.

import Foundation

struct Stock: Codable {
    var data: [Data]
}
 
struct Data: Codable {
    let symbol: String
    let exchange: String
    
}


/*
 {
   "data": [
     {
       "symbol": "AAPL",
       "name": "LEVERAGE SHARES PUBLIC LIMITED ",
       "currency": "GBp",
       "exchange": "LSE",
       "mic_code": "XLON",
       "country": "United Kingdom",
       "type": "Common Stock"
     },
     {
       "symbol": "AAPL",
       "name": "Apple Inc.",
       "currency": "EUR",
       "exchange": "VSE",
       "mic_code": "XWBO",
       "country": "Austria",
       "type": "Common Stock"
     }
   ]
 }
 
*/
