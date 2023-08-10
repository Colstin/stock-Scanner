//
//  StockInfoView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/10/23.
//
// MARK: THIS IS NOT BEING USED
import SwiftUI

struct StockInfoView: View {
    var mockStock: MockStock
    
    var body: some View {
        VStack {
            Text(mockStock.name)
            Text("\(mockStock.price)")
            Text("\(mockStock.gap)")
            Text(mockStock.float)
            Text(mockStock.volume)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 4)
    }
}

struct StockInfoView_Previews: PreviewProvider {
    static var previews: some View {
        StockInfoView(mockStock: MockStock.MOCK_STOCK[0])
    }
}
