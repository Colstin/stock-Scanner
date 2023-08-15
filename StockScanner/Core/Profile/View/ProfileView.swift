//
//  ProfileView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/9/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            
            Spacer()
            // MARK: Username/ Edit
                Button {
                    print("edit")
                } label: {
                    HStack {
                        Text("@Colstin_1")
                        Image(systemName: "pencil.circle")
                           
                    }
                    .foregroundColor(Color("blackwhite"))
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding()
                    
                }
            
            
       
            
            // MARK: Subscription Status
            HStack {
                Text("Subscription: ")
                    .bold()
                Text("Active")
                    .foregroundColor(.green)
            }
            Text("Expires: 3/14/2024")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Spacer()
            Spacer()
            Spacer()
            
            // MARK: Log out
            Button {
                print("Log Out")
            } label: {
                Text("Log out")
                    .font(.headline)
                    .foregroundColor(.green)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.green, lineWidth: 2)
                    )
                    .padding()
     
            }
            Spacer()
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
