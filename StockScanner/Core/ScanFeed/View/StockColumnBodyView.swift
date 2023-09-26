//
//  StockColumnBodyView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/10/23.
//

import SwiftUI

struct StockColumnBodyView: View {
   // let stock: MockStock
    let stockScreener: StockScreener
    
    var body: some View {
        // Use Group here anything else will glitch it
        Group{
            Text(stockScreener.symbol)
            Text(stockScreener.formattedPrice)
            Text("00.0")
            Text("0.00M")
                .padding(10)
                .background(Color(.systemGreen))
                .cornerRadius(10)
            Text(stockScreener.formattedVolume)
                .padding(10)
                .background(Color(.systemBlue))
                .cornerRadius(10)
      
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
