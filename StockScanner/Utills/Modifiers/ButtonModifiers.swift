//
//  ContinueButtonModifier.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/27/23.
//

import SwiftUI

struct SolidButtonModifier: ViewModifier {
    let paddingValue: CGFloat
    let cornerValue: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(Color.white)
            .padding()
            .padding(.horizontal, paddingValue)
            .background(Color(.systemGreen))
            .cornerRadius(cornerValue)
    }
}

struct OverlayButtonModifier: ViewModifier {
    let cornerValue: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(Color(.systemGreen))
            .padding()
            .padding(.horizontal, 90)
            .overlay(
                RoundedRectangle(cornerRadius: cornerValue)
                    .stroke(Color(.systemGreen), lineWidth: 2)
            )
            .padding(5)
    }
}
