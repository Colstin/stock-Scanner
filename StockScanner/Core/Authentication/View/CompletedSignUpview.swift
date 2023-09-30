//
//  CompletedSignUpview.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/27/23.
//

import SwiftUI

struct CompletedSignUpview: View {
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    private let welcomeMessage = "Welcom to Stock Scanner"
    private let clickBelowMessage = "Click below to start Finding Stocks!"
    private let backButtonName = "chevron.left"
    
    var body: some View {
        let username = "@Username"//viewModel.username
        ZStack {
            Color("landingpage")
            VStack(spacing: 50){
                VStack(spacing: 15) {
                    VStack {
                        Text(welcomeMessage)
                        Text(username)
                    }
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                    .multilineTextAlignment(.center)
                    
                    Text(clickBelowMessage)
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                       
                }

                NavigationLink {
                    
                } label: {
                    Text("Complete")
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
    CompletedSignUpview()
        .environmentObject(RegistrationViewModel())
}
