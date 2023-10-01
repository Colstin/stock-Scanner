//
//  MainTabView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/9/23.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    let user: User
    
    var body: some View {
        TabView( selection: $selectedIndex) {
            ScanView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                }.tag(0)
            
            StockSearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }.tag(2)
        }
        .tint(.green)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(user: User.MOCK_USERS[0])
    }
}
