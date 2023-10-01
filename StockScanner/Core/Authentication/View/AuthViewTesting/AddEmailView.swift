//
//  AddEmailView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/27/23.
//

import SwiftUI

struct AddEmailView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel
 
    private let title = "What's your email address?"
    private let subtitle = "You'll use this email to log in next time."
    private let placeholder = "Email Address"
    private let backButtonName = "xmark"
    
    var body: some View {
        ZStack {
            Color("landingpage")
            VStack(spacing: 30){
                AuthInputView(title: title,
                                subtitle: subtitle,
                                placeholder: placeholder,
                                text: $viewModel.email,
                                isSecureField: false)
                
                NavigationLink {
                    CreateUsernameView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Continue")
                        .modifier(SolidButtonModifier(paddingValue: 120, cornerValue: 30))
                       
                }
            }
            .modifier(BackButtonModifier(buttonImage: backButtonName))
        }
        .ignoresSafeArea()
        .modifier(OrientationLockModifier(lockOrientation: .portrait))
    }
}

#Preview {
    AddEmailView()
        .environmentObject(RegistrationViewModel())
}
