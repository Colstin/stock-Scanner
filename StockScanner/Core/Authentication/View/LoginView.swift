//
//  LoginView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/27/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    private let emailPlaceholder = "Email"
    private let passwordPlaceholder = "Password"
    private let forgotPassword = "Forgot Password?"
    private let login = "Login"
    private let backButtonName = "xmark"

    var body: some View {
        ZStack {
            Color("landingpage")
            
            VStack(spacing: 50) {
                
                Image(systemName: "chart.xyaxis.line")

                VStack {
                    AuthInputView(title: nil,
                                    subtitle: nil,
                                    placeholder: emailPlaceholder,
                                    text: $viewModel.email,
                                    isSecureField: false)
                    AuthInputView(title: nil,
                                    subtitle: nil,
                                    placeholder: passwordPlaceholder,
                                    text: $viewModel.password,
                                    isSecureField: true)
                    
                    // Forgot Password
                    Button {
                        print("show forgot password")
                    } label: {
                        Text(forgotPassword)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.top)
                            .padding(.trailing, 28)
                            
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)

                }
                
                // Login Button
                Button {
                   
                } label: {
                    Text(login)
                        .modifier(SolidButtonModifier(paddingValue: 130, cornerValue: 30))
                }
            }
            .modifier(BackButtonModifier(buttonImage: backButtonName))
 
        }
        .ignoresSafeArea()
        .modifier(OrientationLockModifier(lockOrientation: .portrait))
    }
}

#Preview {
    LoginView()
}
