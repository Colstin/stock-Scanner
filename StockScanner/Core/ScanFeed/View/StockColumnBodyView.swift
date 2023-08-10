//
//  StockColumnBodyView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/10/23.
//

import SwiftUI

struct StockColumnBodyView: View {
    let stock: MockStock
    
    var body: some View {
        // same issue which is why we use Goup
        Group{
            Text(stock.name)
            Text(stock.price)
            Text(stock.gap)
            Text(stock.float)
            Text(stock.volume)
        }
        .padding(.bottom)
    }
}

struct StockColumnBodyView_Previews: PreviewProvider {
    static var previews: some View {
        StockColumnBodyView(stock: MockStock.MOCK_STOCK[0])
    }
}
