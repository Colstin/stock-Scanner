//
//  RegistrationView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 10/1/23.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var email = ""
    @State var username = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var passwordsMatch = false
    
    private let emailPlaceholder = "Email"
    private let usernamePlaceholder = "Username"
    private let passwordPlaceholder = "Password"
    private let passwordHelper = """
                                • 6-30 Characters (case-sensitive)
                                • At least 1 Uppercase
                                • At least 1 special char [!?#%@]
                                """
    private let confirmPasswordPlaceholder = "Confirm Password"
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
                                  placeHolderImage: "envelope.fill",
                                  text: $email,
                                  isSecureField: false)
                    
                    AuthInputView(title: nil,
                                  subtitle: nil,
                                  placeholder: usernamePlaceholder, 
                                  placeHolderImage: "person.fill",
                                  text: $username,
                                  isSecureField: false)
                    
                    AuthInputView(title: nil,
                                  subtitle: nil,
                                  placeholder: passwordPlaceholder, 
                                  placeHolderImage: "lock.fill",
                                  text: $password,
                                  isSecureField: true)
                   Text(passwordHelper)
                        .font(.footnote)
                        .padding(.horizontal)
                        .bold()
                   
                    AuthInputView(title: nil,
                                  subtitle: nil,
                                  placeholder: confirmPasswordPlaceholder,
                                  placeHolderImage: passwordsMatch ? "checkmark.circle.fill" : "lock.fill",
                                  text: $confirmPassword,
                                  isSecureField: true)
                    .foregroundStyle(passwordsMatch ? Color.green : Color("blackwhite"))
                    
                }

                .onChange(of: confirmPassword) {
                    if password == confirmPassword && !password.isEmpty {
                        passwordsMatch = true
                    } else {
                        passwordsMatch = false
                    }
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
                        .modifier(SolidButtonModifier(paddingValue: 125, cornerValue: 30))
                }
                .disabled(!formIsValid)//I put function in extensions file
                .opacity(formIsValid ? 1.0 : 0.5)
            }
            .modifier(BackButtonModifier(buttonImage: backButtonName))
        }
        .ignoresSafeArea()
        .modifier(OrientationLockModifier(lockOrientation: .portrait))
    }
}

#Preview {
    RegistrationView()
}
