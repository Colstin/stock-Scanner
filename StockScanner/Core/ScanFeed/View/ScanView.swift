//
//  ScanView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/9/23.
//

import SwiftUI

struct ScanView: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            Text("Stock Scanner")
            
            LazyVGrid(columns: columns) {
                
                // Column headers
                StockColumnHeadersView()
                
                ForEach(MockStock.MOCK_STOCK) { stock in
                    
                 // Column Body
                    StockColumnBodyView(stock: stock)
                }
            }
        }
        //.frame(maxHeight: 400)
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
