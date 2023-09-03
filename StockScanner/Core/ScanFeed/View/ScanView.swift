//
//  ScanView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/9/23.
//

import SwiftUI

struct ScanView: View {
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 5)
    @ObservedObject private var viewModel = ScanViewModel()
    
    var body: some View { 
        NavigationStack{
            ScrollView(showsIndicators: false){
                LazyVGrid(columns: columns, spacing: 10, pinnedViews: [.sectionHeaders]) {
                    Section {
                        if let stock = viewModel.stock {
                            ForEach(stock.data.prefix(30), id: \.symbol) { stockdata in
                                StockColumnBodyView(stockData: stockdata)
                            }
                        }
                        
                    } header: {
                        StockColumnHeadersView()
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemGray6))
                        .frame(maxWidth: 680)
                        .shadow(color: Color("ScanShaddowColor").opacity(0.4), radius: 10, x: 0, y: 4)
                )
            }
            .navigationTitle("Gap Scanner")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("Edit Button")
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(Color("greywhite"))
                            .font(.subheadline)
                    }
                }
            }
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
