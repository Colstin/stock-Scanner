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
            Text("[ Profile View ]")
                .padding(.bottom, 25)
            
            Text("Username: Colstin_1")
            Text("Subscription: Active")
            
            Text("Sign Out")
        }
        
       
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
