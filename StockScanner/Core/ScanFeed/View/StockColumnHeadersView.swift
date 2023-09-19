//
//  StockColumnHeadersView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/10/23.
//

import SwiftUI

struct StockColumnHeadersView: View {
    
    let horizontalPadding: CGFloat?
    
    // Header Constants
    private let nameHeader = "Name"
    private let priceHeader = "Price"
    private let gapHeader = "Gap"
    private let floatHeader = "Float"
    private let volumeHeader = "Vol"
    
    private let dollarSymbol = "($)"
    private let percentSymbol = "(%)"
    private let shrSymbol = "(Shr)"
    
    var body: some View {
        HStack(){
            Text(nameHeader)
            Spacer()
            VStack {
                Text(priceHeader)
                Text(dollarSymbol)
                    .font(.subheadline)
            }
            Spacer()
            VStack {
                Text(gapHeader)
                Text(percentSymbol)
                    .font(.subheadline)
            }
            Spacer()
            VStack {
                Text(floatHeader)
                Text(shrSymbol)
                    .font(.subheadline)
            }
            Spacer()
            Text(volumeHeader)

         }
         .padding(.vertical, 3)
         .padding(.horizontal, horizontalPadding)
         .frame(maxWidth: .infinity)
         .background(Color(.systemGray3))
         .font(.headline)
    }
}

struct StockColumnHeadersView_Previews: PreviewProvider {
    static var previews: some View {
        StockColumnHeadersView(horizontalPadding: nil)
    }
}
