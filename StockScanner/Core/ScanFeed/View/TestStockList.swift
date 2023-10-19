//
//  TestStockList.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 10/19/23.
//

import SwiftUI

struct TestStockList: View {
    @ObservedObject var viewModel: ScanViewModel
    
    var body: some View {
        List(viewModel.stockScreener.map { $0.symbol }, id: \.self) { symbol in
            if let stockQuote = viewModel.fullStockData[symbol] {
                HStack {
                    Text("\(stockQuote.symbol)")
                    Text("\(stockQuote.price)")
                    Text("\(stockQuote.changesPercentage)")
                    Text("\(stockQuote.volume)")
                }
            }
        }
    }
}

#Preview {
    TestStockList(viewModel: ScanViewModel())
}
