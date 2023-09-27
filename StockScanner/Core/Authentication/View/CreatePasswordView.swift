//
//  CreatePasswordView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/27/23.
//

import SwiftUI

struct CreatePasswordView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
 
    private let title = "Choose a Password"
    private let subtitle = ""
    private let placeholder = "Password"
    
    var body: some View {
        ZStack {
            Color("landingpage")
            VStack{
                CreateInputView(title: title,
                                subtitle: subtitle,
                                placeholder: placeholder,
                                text: $viewModel.email,
                                isSecureField: true)
                
                NavigationLink {
                    CompletedSignUpview()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Continue")
                        .modifier(ContinueButtonModifier())
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CreatePasswordView()
        .environmentObject(RegistrationViewModel())
}
