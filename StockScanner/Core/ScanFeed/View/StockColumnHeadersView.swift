//
//  StockColumnHeadersView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/10/23.
//

import SwiftUI

struct StockColumnHeadersView: View {
    var body: some View {
        //Anything but group will glitch it, can see it here but it works
        Group{
            Text("Name")
            VStack {
                Text("Price")
                Text("($)")
                    .font(.subheadline)
            }
            VStack {
                Text("Gap")
                Text("(%)")
                    .font(.subheadline)
            }
            VStack {
                Text("Float")
                Text("(Shr)")
                    .font(.subheadline)
            }
            Text("Vol")
        }
        .frame(width: 110, height: 50)
        .background(Color(.systemGray3))
        .cornerRadius(10)
        .font(.headline)
           
    }
}

struct StockColumnHeadersView_Previews: PreviewProvider {
    static var previews: some View {
        StockColumnHeadersView()
    }
}
