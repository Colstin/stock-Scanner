//
//  RegistrationStandardView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 10/1/23.
//

import SwiftUI

struct RegistrationStandardView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    
    private let emailPlaceholder = "Email"
    private let usernamePlaceholder = "Username"
    private let passwordPlaceholder = "Password"
    private let forgotPassword = "Forgot Password?"
    private let login = "SIGN UP"
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
                                    text: $email,
                                    isSecureField: false)
                    
                    AuthInputView(title: nil,
                                    subtitle: nil,
                                    placeholder: usernamePlaceholder,
                                    text: $username,
                                    isSecureField: false)
                    
                    AuthInputView(title: nil,
                                    subtitle: nil,
                                    placeholder: passwordPlaceholder,
                                    text: $password,
                                    isSecureField: true)
                }
                
                // Sign up Button
                Button {
                    Task {
                        try await viewModel.createUser(withEmail:email, 
                                                       password: password,
                                                       username: username)
                    }
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
    RegistrationStandardView()
}
