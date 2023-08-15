//
//  ProfileView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/9/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                
                Spacer()
                // MARK: Username/ Edit
                VStack{
                    Button {
                        print("edit")
                    } label: {
                        CircularProfileImageView()
                    }
                    
                    Text("@Colstin_1")
                        .foregroundColor(Color("blackwhite"))
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding()
                    
                    // MARK: Subscription Status
                    HStack {
                        Text("Subscription: ")
                            .bold()
                        Text("Active")
                            .foregroundColor(.green)
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
                    print("Log Out")
                } label: {
                    LogoutButtonView(loginText: "Log Out")
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
