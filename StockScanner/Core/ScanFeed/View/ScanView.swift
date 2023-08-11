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
            HStack {
                Text("Daily Gap Scanner")
                Image(systemName: "triangle.fill")
                    .rotationEffect(.degrees(180))
                    .font(.system(size: 10))
            }
           
            ScrollView {
                LazyVGrid(columns: columns) {
                    // Column headers
                     StockColumnHeadersView()
                              
                    ForEach(MockStock.MOCK_STOCK) { stock in
                     // Column Body
                        StockColumnBodyView(stock: stock)
                    }
                }
                .background(Color(.systemGray6))
                //.shadow(radius: 10)
                .padding(.top, 20)
                
            }
        }
        //.frame(maxHeight: 400) // useful when/ if we add ability for multiple scanners on the one screen
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
