//
//  ProfileView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/9/23.
//

import SwiftUI
import WebKit

struct ProfileView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var logOutConfirmation = false
    @State private var deleteConfirmation = false
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 30) {
                    TapeWebView(htmlString: TradingViewHTML.generateTickerTapeHTML(colorScheme))
                        .frame(height: 40)
                        .edgesIgnoringSafeArea(.all ) 
                        .disabled(true)
                    
                    // MARK: Username/ Edit
                    VStack(alignment: .center){
                        Button {
                            print("edit")
                        } label: {
                            CircularProfileImageView()
                                .padding(.leading)
                        }
                        
                        Text("@Colstin1")
                            .foregroundColor(Color("blackwhite"))
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding(.vertical)
                            
                        
                        // MARK: Subscription Status
                        HStack {
                            Text("Subscription: ")
                                .bold()
                            Button {
                                print("Active Subscripion")
                            } label: {
                                ActiveButtonComponent()
                            }
                        }
                        .padding(.top, 20)
                        
                        Text("Expires: 3/14/2024")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .italic()
                    }
                  
                    // MARK: legal
                    LegalNoticeView()
                    
                    Spacer()
                    Spacer()
                    
                    
                    
                    // MARK: Log out
                    Button {
                        logOutConfirmation = true
                    } label: {
                        Text("Log out")
                            .modifier(OverlayButtonModifier(cornerValue: 30))
                    }
                    .alert("Are you sure?", isPresented: $logOutConfirmation) {
                        Button("Log Out", role: .destructive) {
                            viewModel.signOut()
                        }
                    }
                 
                    
                    // MARK: Delete
                    Button {
                        deleteConfirmation = true
                    } label: {
                        Text("Delete Account")
                            .foregroundStyle(.red )   
                    }
                    .alert("Are you sure?", isPresented: $deleteConfirmation, actions: {
                        Button("Delete", role: .destructive, action: {  })
                    }, message: {
                        Text("Note: This will permanently delete your account")
                    })
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "line.3.horizontal")
                        .imageScale(.large)
                }
            }
        }
       
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
