//
//  LandingPage.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/27/23.
//

import SwiftUI

struct LandingPage: View {
    private let welcome = "Welcome to"
    private let companyName = "Stock Scanner"
    private let signUp = "Sign up"
    private let logIn = "Log in"
   
    
    var body: some View {
       
        NavigationStack {
            // MARK: Title Area
            
            ZStack {
                Color("landingpage")
                VStack {
                    Spacer()
                    
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
                    
                    //MARK: Log in/ Sign out
                    VStack {
                        NavigationLink {
                            AddEmailView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text(signUp)
                                  .font(.headline)
                                  .foregroundColor(Color.white)
                                  .padding()
                                  .padding(.horizontal, 84)
                                  .background(Color(.systemGreen))
                                  .cornerRadius(10)
                        }
                        
                        NavigationLink {
                            LoginView()
                        } label: {
                            Text(logIn)
                                .font(.headline)
                                .foregroundColor(Color(.systemGreen))
                                .padding()
                                .padding(.horizontal, 90)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(.systemGreen), lineWidth: 2)
                                )
                                .padding(5)
                        }
                    }
                    
                    Spacer()
                }
            }
            .ignoresSafeArea()
           
        }
    }
}

#Preview {
    LandingPage()
}
