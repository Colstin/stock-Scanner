//
//  MainTabView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/9/23.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView( selection: $selectedIndex) {
            ScanView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                }.tag(0)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }.tag(1)
        }
        .tint(.green)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
