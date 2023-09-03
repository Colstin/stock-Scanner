//
//  StockColumnHeadersView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/10/23.
//

import SwiftUI

struct StockColumnHeadersView: View {
    var body: some View {
        HStack{
            Text("Name")
            Spacer()
            VStack {
                Text("Price")
                Text("($)")
                    .font(.subheadline)
            }
            Spacer()
            VStack {
                Text("Gap")
                Text("(%)")
                    .font(.subheadline)
            }
            Spacer()
            VStack {
                Text("Float")
                Text("(Shr)")
                    .font(.subheadline)
            }
            Spacer()
            Text("Vol")
        }
        .padding(.vertical, 3)
        .padding(.horizontal, 20)
        .frame(maxWidth: 680)
        .background(Color(.systemGray3))
        .font(.headline)
    }
}

struct StockColumnHeadersView_Previews: PreviewProvider {
    static var previews: some View {
        StockColumnHeadersView()
    }
}
