//
//  CreateUsernameView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/27/23.
//

import SwiftUI

struct CreateUsernameView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel
 
    private let title = "Create a Username"
    private let subtitle = "Be Creative with Your Username"
    private let placeholder = "@Username"
    private let backButtonName = "chevron.left"
    
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
                    CreatePasswordView()
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
    CreateUsernameView()
        .environmentObject(RegistrationViewModel())
}
