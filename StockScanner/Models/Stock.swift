//
//  Stock.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/3/23.
// MARK: This will contain a List of like 4700 Stock names, wont be able to get price etc.. from here

import Foundation

struct Stock: Codable {
    var data: [Data]
}
 
struct Data: Codable {
    let symbol: String
    let exchange: String
    
}

// Json Data
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
     },
     {
       "symbol": "AAPL",
       "name": "Apple Inc.",
       "currency": "ARS",
       "exchange": "BCBA",
       "mic_code": "XBUE",
       "country": "Argentina",
       "type": "Common Stock"
     },
     {
       "symbol": "AAPL",
       "name": "Apple Inc.",
       "currency": "CAD",
       "exchange": "NEO",
       "mic_code": "NEOE",
       "country": "Canada",
       "type": "Common Stock"
     },
     {
       "symbol": "AAPL",
       "name": "1X AAPL",
       "currency": "EUR",
       "exchange": "Euronext",
       "mic_code": "XAMS",
       "country": "Netherlands",
       "type": "Common Stock"
     },
     {
       "symbol": "AAPL",
       "name": "Apple Inc",
       "currency": "USD",
       "exchange": "NASDAQ",
       "mic_code": "XNGS",
       "country": "United States",
       "type": "Common Stock"
     },
     {
       "symbol": "AAPL",
       "name": "Apple Inc",
       "currency": "COP",
       "exchange": "BVC",
       "mic_code": "XBOG",
       "country": "Colombia",
       "type": "Common Stock"
     },
     {
       "symbol": "AAPL",
       "name": "Apple Inc.",
       "currency": "MXN",
       "exchange": "BMV",
       "mic_code": "XMEX",
       "country": "Mexico",
       "type": "Common Stock"
     },
     {
       "symbol": "AAPL",
       "name": "APPLE",
       "currency": "EUR",
       "exchange": "MTA",
       "mic_code": "XMIL",
       "country": "Italy",
       "type": "Common Stock"
     },
     {
       "symbol": "AAPL",
       "name": "Apple Inc.",
       "currency": "USD",
       "exchange": "BVS",
       "mic_code": "XSGO",
       "country": "Chile",
       "type": "Common Stock"
     }
   ]
  
 }
 
*/
