//
//  StockError.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/3/23.
//

import Foundation

enum StockError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidData
    case noMatchingData
    case unkown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL was invalid"
        case .invalidResponse:
            return "There was an error with the response"
        case .invalidData:
            return "The Json data cant parse into data model"
        case .noMatchingData:
            return "There is no matching data available for a particular symbol in your list from the API"
        case .unkown(let error):
            return error.localizedDescription
        }
    }
}
