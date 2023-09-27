//
//  RegistrationViewModel.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/27/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
}
