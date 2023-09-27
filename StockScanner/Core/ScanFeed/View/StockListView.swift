//
//  StockListView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/8/23.
//

import SwiftUI

struct StockListView: View {
    
    @ObservedObject var viewModel: ScanViewModel
    @Binding var isLandscape: Bool
    var prefixNum: Int
    var columns: [GridItem]
    
    var body: some View {
        ScrollView(showsIndicators: false){
            ZStack {
                LazyVGrid(columns: columns, spacing: 10, pinnedViews: [.sectionHeaders]) {
                    Section {
                        if viewModel.stockScreener.isEmpty {
                            ProgressView().tint(.green)
                            /*
                            ForEach(MockStock.MOCK_STOCK.prefix(prefixNum)) { stock in
                               Group {
                                   Text(stock.name)
                                   Text(stock.price)
                                   Text(stock.gap)
                                   Text(stock.float)
                                   Text(stock.volume)
                               }
                               .padding(.bottom)
                           }
                             */
                        } else {
                           
                            ForEach(viewModel.stockScreener, id: \.symbol) { stock in
                               StockColumnBodyView(stockScreener: stock)
                            }
                            
                        }
                    } header: {
                        if isLandscape {
                            StockColumnHeadersView(horizontalPadding: 60)
                        } else {
                            StockColumnHeadersView(horizontalPadding: nil)
                        }
                    }
                }
                .background (
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemGray6))
                        .frame(maxWidth: .infinity )
                        .shadow(color: Color(.systemGreen).opacity(0.2), radius: 10, x: 0, y: 10)
                )
            }
        }
        .ignoresSafeArea(edges: .horizontal)
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 5)
        
        StockListView(viewModel: ScanViewModel(),
                      isLandscape: Binding.constant(false),
                      prefixNum: 30,
                      columns: columns)
    }
}



