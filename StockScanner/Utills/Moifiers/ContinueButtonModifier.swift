//
//  ContinueButtonModifier.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/27/23.
//

import SwiftUI

struct ContinueButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal, 125)
            .background(Color(.systemGreen))
            .cornerRadius(8)
            .padding(.vertical)
    }
}
