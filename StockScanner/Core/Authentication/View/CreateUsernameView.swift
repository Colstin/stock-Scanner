//
//  CreateUsernameView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/27/23.
//

import SwiftUI

struct CreateUsernameView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
 
    private let title = "Create a Username"
    private let subtitle = "Be Creative with Your Username"
    private let placeholder = "@Username"
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
                    CreatePasswordView()
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
    CreateUsernameView()
        .environmentObject(RegistrationViewModel())
}
