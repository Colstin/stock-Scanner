//
//  CreateInputView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/27/23.
//

import SwiftUI

struct AuthInputView: View {
    let title: String?
    let subtitle: String?
    let placeholder: String
    let placeHolderImage: String
    @Binding var text: String
    var isSecureField = false
   

    var body: some View {
        VStack(spacing: 80) {
            if title != nil && subtitle != nil {
                VStack {
                    Text(title ?? "")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    Text(subtitle ?? "")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                }
            }
            
            if isSecureField {
                HStack {
                    Image(systemName: placeHolderImage)
                    SecureField(placeholder, text: $text)
                }
                .autocorrectionDisabled(true)
                .modifier(TextFieldModifier(text: $text))
                .padding(.top)
              
            } else {
                HStack {
                    Image(systemName: placeHolderImage)
                    TextField(placeholder, text: $text)
                }
                .textInputAutocapitalization(.none)
                .autocorrectionDisabled(true)
                .modifier(TextFieldModifier(text: $text))
                .padding(.top)
                
            }
        }
    }
}

#Preview {
    AuthInputView(title: "Title", subtitle: "Subtitle", placeholder: "Placeholder", placeHolderImage: "envelope.fill", text: .constant(""))
}
