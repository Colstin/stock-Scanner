//
//  StockColumnBodyView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/10/23.
//

import SwiftUI

struct StockColumnBodyView: View {
   // let stock: MockStock
   let stockData: Data
    
    var body: some View {
        // same issue which is why we use Goup
//        Group{
//            Text(stock.name)
//            Text(stock.price)
//            Text(stock.gap)
//            Text(stock.float)
//                .padding(10)
//                .background(Color(.systemGreen))
//                .cornerRadius(10)
//            Text(stock.volume)
//                .padding(10)
//                .background(Color(.systemBlue))
//                .cornerRadius(10)
//        }
//        .padding(.bottom)
        
        Group{
           Text(stockData.symbol)
            Text("'1.44'")
            Text("'133.8'")
            Text("3.95M")
                .padding(10)
                .background(Color(.systemGreen))
                .cornerRadius(10)
            Text("4.81M")
                .padding(10)
                .background(Color(.systemBlue))
                .cornerRadius(10)
        }
        .padding(.bottom)
       
    }
}

struct StockColumnBodyView_Previews: PreviewProvider {
    static var previews: some View {
        StockColumnBodyView(stockData: Data(symbol: "Appl", exchange: "NASDAQ"))
        // StockColumnBodyView(stock: MockStock.MOCK_STOCK[0])
    }
}
