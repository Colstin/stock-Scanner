//
//  LandingPage.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 10/1/23.
//

import SwiftUI

struct LandingPage: View {
    
    private let welcome = "Welcome to"
    private let companyName = "Stock Scanner"
    private let signUp = "Sign up"
    private let logIn = "Log in"
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("landingpage")
                
                VStack {
                    Spacer()
                    
                    // MARK: Title Area
                    VStack(spacing: 20) {
                        Image(systemName: "chart.xyaxis.line")
                        VStack {
                            Text(welcome)
                            Text(companyName)
                        }
                        .font(.largeTitle)
                        .fontWeight(.thin)
                    }
                    
                    Spacer()

                    //MARK: Sign up
                    VStack {
                        NavigationLink {
                            RegistrationView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text(signUp)
                                .modifier(SolidButtonModifier(paddingValue: 84, cornerValue: 10))
                        }
                        
                    //MARK: Log in
                         NavigationLink {
                             LoginView()
                                 .navigationBarBackButtonHidden()
                         } label: {
                             Text(logIn)
                                 .modifier(OverlayButtonModifier(cornerValue: 10))
                         }
                    }
                    
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }
        .modifier(OrientationLockModifier(lockOrientation: .portrait))
    }
}

#Preview {
    LandingPage()
}
