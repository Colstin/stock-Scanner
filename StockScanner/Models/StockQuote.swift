//
//  StockQuote.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/3/23.
//

import Foundation

struct StockQuote: Codable {
    var symbol: String
    var volume: Int
    var change: Double
    var percent_change: Double
}



/*
{
  "symbol": "AMZN",
  "name": "Amazon.com Inc",
  "exchange": "NASDAQ",
  "mic_code": "XNGS",
  "currency": "USD",
  "datetime": "2023-09-05",
  "timestamp": 1693943940,
  "open": "137.73000",
  "high": "137.80000",
  "low": "135.82001",
  "close": "137.25000",
  "volume": "32462155",
  "previous_close": "138.14000",
  "change": "-0.89000",
  "percent_change": "-0.64427",
  "average_volume": "40461316",
  "is_market_open": false,
  "fifty_two_week": {
    "low": "81.43000",
    "high": "143.63000",
    "low_change": "55.82000",
    "high_change": "-6.38000",
    "low_change_percent": "68.54967",
    "high_change_percent": "-4.44197",
    "range": "81.430000 - 143.630005"
  }
}
*/
