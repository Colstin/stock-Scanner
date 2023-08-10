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
                Text("Price ($)")
                VStack {
                    Text("Gap")
                    Text("(%)")
                        .font(.subheadline)
                }
                Text("Float (Shr)")
                Text("Vol")
            }
            .padding(10)
            .font(.headline)
    }
}

struct StockColumnHeadersView_Previews: PreviewProvider {
    static var previews: some View {
        StockColumnHeadersView()
    }
}
