//
//  CreatePasswordView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/27/23.
//

import SwiftUI

struct CreatePasswordView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel
 
    private let title = "Choose a Password"
    private let subtitle = ""
    private let placeholder = "Password"
    private let backButtonName = "chevron.left"
    
    var body: some View {
        ZStack {
            Color("landingpage")
            VStack(spacing: 30){
//                AuthInputView(title: title,
//                                subtitle: subtitle,
//                                placeholder: placeholder,
//                                text: $viewModel.email,
//                                isSecureField: true)
                
                NavigationLink {
                    CompletedSignUpview()
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
    CreatePasswordView()
        .environmentObject(RegistrationViewModel())
}
