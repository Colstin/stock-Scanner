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
                        if let stock = viewModel.stock {
                            ForEach(stock.data.prefix(prefixNum), id: \.symbol) { stockdata in
                                StockColumnBodyView(stockData: stockdata)
                            }
                        } else {
                            //ProgressView().tint(.green)
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
                        //.padding(.top, calculateTopPadding(prefixNum))
                        .frame(maxWidth: .infinity )
                       // .frame(minHeight: calculateMinHeight(prefixNum))
                        .shadow(color: Color(.systemGreen).opacity(0.2), radius: 10, x: 0, y: 10)
                        
                )
            }
        }
        .ignoresSafeArea(edges: .horizontal)
    }
    
    func calculateTopPadding(_ prefixNum: Int) -> CGFloat? {
        let paddingValues: [Int: CGFloat] = [
            5: isLandscape ? 60 : 90,
            10: isLandscape ? 90 : 120,
            20: 40
        ]
        return paddingValues[prefixNum] ?? nil
    }
    
    func calculateMinHeight(_ preficNum: Int) -> CGFloat? {
        let heightValues: [Int: CGFloat] = [
            5: isLandscape ? 420 : 430,
            10: isLandscape ? 800 : 830,
            20: isLandscape ? 1000 : 1100
        ]
        return heightValues[preficNum] ?? nil
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


/*
 .background (
     RoundedRectangle(cornerRadius: 10)
         .fill(Color(.systemGray6))
         //.padding(.top, calculateTopPadding(prefixNum))
         .frame(maxWidth: .infinity )
        // .frame(minHeight: calculateMinHeight(prefixNum))
         .shadow(color: Color(.systemGreen).opacity(0.2), radius: 10, x: 0, y: 10)
         
 )
 
 
 func calculateTopPadding(_ prefixNum: Int) -> CGFloat? {
     let paddingValues: [Int: CGFloat] = [
         5: isLandscape ? 60 : 90,
         10: isLandscape ? 90 : 120,
         20: 40
     ]
     return paddingValues[prefixNum] ?? nil
 }
 */
