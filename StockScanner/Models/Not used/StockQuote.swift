//
//  StockQuote.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/3/23.
//

import Foundation

struct StockQuote: Codable {
    let price: Double?
    let change_point: Double?
    var change_percentage: Double?
    var total_vol: String?
}



/* https://realstonks.p.rapidapi.com/TSLA
{
  "price": 247.2,
  "change_point": -8.5,
  "change_percentage": -3.32,
  "total_vol": "88.72M"
}
*/
