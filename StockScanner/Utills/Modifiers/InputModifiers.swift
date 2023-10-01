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
     let strokeColor = Color("blackwhite")// I wnat to make this dynamic somehow
    
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.leading)
            .padding(12)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(strokeColor), lineWidth: 3)
            )
            .cornerRadius(10)
            .padding(.horizontal, 24)
            .tint(Color("blackwhite"))
        
            // goal is to make this navigate the screens
            //.focused($isInputActive)
//            .toolbar {
//                 ToolbarItem(placement: .keyboard) {
//                    // Spacer()
//                     Button("Continue") {
//                         isInputActive = false
//                     }
//                 }
//             }
    }
}

