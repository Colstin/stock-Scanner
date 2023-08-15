//
//  LogoutButtonView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/15/23.
//

import SwiftUI

struct LogoutButtonView: View {
    let loginText: String
    let textColor = Color(.systemGreen)
    
    var body: some View {
        Text(loginText)
            .font(.headline)
            .foregroundColor(textColor)
            .padding()
            .padding(.horizontal, 40)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(textColor, lineWidth: 2)
            )
            .padding()
    }
}

struct LogoutButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LogoutButtonView(loginText: "Log out")
    }
}
