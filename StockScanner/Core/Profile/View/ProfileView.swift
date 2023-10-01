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
                        viewModel.signOut()
                    } label: {
                        Text("Log out")
                            .modifier(OverlayButtonModifier(cornerValue: 30))
                    }
                    
                    // MARK: Delete
                    Button {
                        print("Delete account")
                    } label: {
                        Text("Delete Account")
                            .foregroundStyle(.red )   
                    }
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
