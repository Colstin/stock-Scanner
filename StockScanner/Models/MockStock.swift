//
//  MockStock.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/10/23.
//
//MARK: This does not represent any API, Only for MOCK_DATA
import Foundation

struct MockStock: Identifiable {
      var id: String
      var name: String
      var price: String
      var gap: String
      var float: String
      var volume: String
}

extension MockStock{
    static var MOCK_STOCK: [MockStock] = [
        .init(id: NSUUID().uuidString, name: "SVFD", price: "1.48", gap: "133.8", float: "3.95M", volume: "4.81M"),
        .init(id: NSUUID().uuidString, name: "APPL", price: "1.48", gap: "133.8", float: "3.95M", volume: "4.81M"),
        .init(id: NSUUID().uuidString, name: "MSF", price: "1.48", gap: "133.8", float: "3.95M", volume: "4.81M"),
        .init(id: NSUUID().uuidString, name: "RIOT", price: "1.48", gap: "133.8", float: "3.95M", volume: "4.81M")
    ]
}
