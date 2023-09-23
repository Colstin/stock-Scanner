//
//  StockColumnBodyView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/10/23.
//

import SwiftUI

struct StockColumnBodyView: View {
   // let stock: MockStock
    let stockData: String
   // let stockQuote: StockQuote?
    
    var body: some View {
        // Use Group here anything else will glitch it
        Group{
            Text(stockData)
            
            //if let quote = stockQuote {
                Text("price")
                Text("'133.8'")
                Text("3.95M")
                    .padding(10)
                    .background(Color(.systemGreen))
                    .cornerRadius(10)
                Text("3.90M")
                    .padding(10)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
           // }
        }
        .padding(.bottom)
       
    }
}
/*
struct StockColumnBodyView_Previews: PreviewProvider {
    static var previews: some View {
        StockColumnBodyView(stockData: "symbol")
        // StockColumnBodyView(stock: MockStock.MOCK_STOCK[0])
    }
}
*/
