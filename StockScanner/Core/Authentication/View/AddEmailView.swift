//
//  AddEmailView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/27/23.
//

import SwiftUI

struct AddEmailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
 
    private let title = "What's your email address?"
    private let subtitle = "You'll use this email to log in next time."
    private let placeholder = "Email Address"
    
    var body: some View {
        ZStack {
            Color("landingpage")
            VStack{
                CreateInputView(title: title,
                                subtitle: subtitle,
                                placeholder: placeholder,
                                text: $viewModel.email,
                                isSecureField: false)
                
                NavigationLink {
                    CreateUsernameView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Continue")
                        .modifier(ContinueButtonModifier())
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "xmark")
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
    AddEmailView()
        .environmentObject(RegistrationViewModel())
}
