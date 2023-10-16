//
//  RegistrationExtension.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 10/1/23.
//

import SwiftUI

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return isValidEmail(email)
        && isStrongPassword(password)
        && passwordsMatch(password, confirmPassword)
        && !username.isEmpty
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = try? NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        let range = NSRange(location: 0, length: email.utf16.count)
        return emailRegex?.firstMatch(in: email, options: [], range: range) != nil
   }
    
    private func isStrongPassword(_ password: String) -> Bool {
        guard !password.isEmpty, password.count >= 8 && password.count <= 30 else { return false }
        
        let specialCharacters = CharacterSet(charactersIn: "!?#%@")
        let numericCharacters = CharacterSet.decimalDigits
        
        let specialCharacterRange = password.rangeOfCharacter(from: specialCharacters)
        let numericCharacterRange = password.rangeOfCharacter(from: numericCharacters)

        return specialCharacterRange != nil && numericCharacterRange != nil
    }
    
    private func passwordsMatch(_ password: String, _ conformPassword: String) -> Bool {
        return password == conformPassword
    }
}

//Idea is to also create individual stuff so we can implement these onto each imput for email, pass etc.. 
