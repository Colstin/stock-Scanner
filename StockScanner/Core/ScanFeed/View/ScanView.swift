//
//  ScanView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/9/23.
//

import SwiftUI

struct ScanView: View {
    @State var isHeader = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                //Text("Daily Gap Scanner")
                
                LazyVGrid(columns: columns) {
                    
                    // Column headers
                   
                        StockColumnHeadersView()
                          
                        
                    ForEach(MockStock.MOCK_STOCK) { stock in
                        
                     // Column Body
                        StockColumnBodyView(stock: stock)
                    }
                }
                .background(Color(.systemGray4))
                .padding(.top, 20)
                
            }
            .navigationTitle("Daily Gap Scanner")
           .navigationBarTitleDisplayMode(.inline)
        }
        //.frame(maxHeight: 400) // useful when/ if we add ability for multiple scanners on the one screen
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
