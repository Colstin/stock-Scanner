//
//  CustomProtocols.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 10/1/23.
//

import Foundation

// It's a read-only computed property that returns a Boolean
// Used for our User Registration validation function in our custom extensions
protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}
