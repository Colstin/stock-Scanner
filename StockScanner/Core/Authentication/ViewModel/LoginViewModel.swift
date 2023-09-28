//
//  LoginViewModel.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/28/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
}
