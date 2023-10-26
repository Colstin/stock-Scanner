//
//  ProfileEditSheetView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 10/26/23.
//

import SwiftUI

struct ProfileEditSheetView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var logOutConfirmation = false
    @State private var deleteConfirmation = false
    @State var demo = "@Testing"
    
    var body: some View {
        
        VStack {
            HStack {
                Button("Cancel") {
                    dismiss()
                }
                .foregroundStyle(Color(.systemGray))
                Spacer()
                
                Text("Settings")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    Task {
                        
                    }
                } label: {
                    Text("Done")
                        
                }
            }
            .padding(.horizontal)
            .padding(.top)
            .foregroundStyle(Color("blackwhite"))
            
            Divider()
                .background(Color("greywhite"))
                
        }
      
        
        ScrollView{
            VStack(spacing: 50){
                
                VStack {
                    CircularProfileImageView()
                        .padding(.leading, 30)
                    
                    ProfileEditInputView(title: "Username",
                                         placeholder: "@Username",
                                         text: $demo)
                    
                    // MARK: legal
                    LegalNoticeView()
                }
                
                VStack(spacing: 30) {
                    // MARK: Log out
                    Button {
                        logOutConfirmation = true
                    } label: {
                        Text("Log out")
                            .modifier(OverlayButtonModifier(cornerValue: 30))
                    }
                    .alert("Are you sure?", isPresented: $logOutConfirmation) {
                        Button("Log out", role: .destructive) {
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
                        Button("Delete", role: .destructive){
                            Task {
                                try await viewModel.deleteAccount()
                            }
                        }
                    }, message: {
                        Text("Note: This will permanently delete your account")
                    })
                    
                    
                    // MARK: LOGO Area
                    VStack {
                        Image(systemName: "chart.xyaxis.line")
                        Text("StockFinder")
                            .font(.title)
                            .padding(.bottom)
                        Text("Version 1.000.0")
                        Text("Created for Traders")
                    }
                    .padding(.top)
                    .foregroundStyle(Color(.systemGray))
                    
                }
                
               
                
            }
           
            
            
        }

    }
}

struct ProfileEditInputView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack{
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            
            VStack {
                TextField(placeholder, text: $text)
                
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}

#Preview {
    ProfileEditSheetView()
}
