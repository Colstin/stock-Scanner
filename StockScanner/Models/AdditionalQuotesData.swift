//
//  AdditionalQuotesData.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 10/16/23.
//

import Foundation

struct AdditionalQuotesData: Codable {
    let symbol: String
    let changesPercentage: Double
    let change: Double
}

/*
 [
   {
     "symbol" : "AAPL",
     "name" : "Apple Inc.",
     "price" : 146.15000000,
     "changesPercentage" : 2.60000000,
     "change" : 3.70000000,
     "dayLow" : 142.96000000,
     "dayHigh" : 147.09970000,
     "yearHigh" : 150.00000000,
     "yearLow" : 89.14500000,
     "marketCap" : 2438892617728.00000000,
     "priceAvg50" : 135.25772000,
     "priceAvg200" : 130.42052000,
     "volume" : 96350036,
     "avgVolume" : 84504517,
     "exchange" : "NASDAQ",
     "open" : 143.46000000,
     "previousClose" : 142.45000000,
     "eps" : 4.44900000,
     "pe" : 32.85008000,
     "earningsAnnouncement" : "2021-07-27T20:00:00.000+0000",
     "sharesOutstanding" : 16687599163,
     "timestamp" : 1626873796
   }, {
     "symbol" : "FB",
     "name" : "Facebook, Inc.",
     "price" : 341.66000000,
     "changesPercentage" : 1.40000000,
     "change" : 4.71000000,
     "dayLow" : 334.50000000,
     "dayHigh" : 343.45000000,
     "yearHigh" : 358.79000000,
     "yearLow" : 226.90000000,
     "marketCap" : 968763310080.00000000,
     "priceAvg50" : 340.76886000,
     "priceAvg200" : 300.44614000,
     "volume" : 10531858,
     "avgVolume" : 16914280,
     "exchange" : "NASDAQ",
     "open" : 338.80000000,
     "previousClose" : 336.95000000,
     "eps" : 11.67100000,
     "pe" : 29.27427100,
     "earningsAnnouncement" : "2021-07-28T20:00:00.000+0000",
     "sharesOutstanding" : 2835460136,
     "timestamp" : 1626873796
   }
 ]
 */
