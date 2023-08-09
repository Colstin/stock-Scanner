//
//  ScanView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/9/23.
//

import SwiftUI

struct ScanView: View {
    let data = (1...100).map { "\($0)"}
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(data, id: \.self) { item in
                    Text(item)
                }
            }
        }
        //.frame(maxHeight: 400)
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
