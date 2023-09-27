//
//  TextFieldModifier.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/27/23.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
     @FocusState private var isInputActive: Bool
     @Binding var text: String
    
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .padding(12)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("blackwhite"), lineWidth: 3)
            )
            .cornerRadius(10)
            .padding(.horizontal, 24)
            .tint(Color("blackwhite"))
        
            // goal is to make this navigate the screens
            .focused($isInputActive)
            .toolbar {
                 ToolbarItem(placement: .keyboard) {
                     Button("Continue") {
                         isInputActive = false
                     }
                 }
             }
    }
}

