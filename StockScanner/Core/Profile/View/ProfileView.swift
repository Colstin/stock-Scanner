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
    @State private var showingSheet = false
    
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
                }
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(Color(.systemGray))
                            
                    }
                    .sheet(isPresented: $showingSheet){
                        ProfileEditSheetView()
                    }
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
