//
//  ScanView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/9/23.
//

import SwiftUI

struct ScanView: View {
    
    @ObservedObject private var viewModel = ScanViewModel()
    @State private var isLandscape = false
    private var prefixNum = 30
    
    private var columns: [GridItem]{
        Array(repeating: .init(.flexible()), count: 5)
    }
    
    var body: some View { 
        NavigationStack{
            ScrollView(showsIndicators: false){
                LazyVGrid(columns: columns, spacing: 10, pinnedViews: [.sectionHeaders]) {
                    Section {
                        if let stock = viewModel.stock {
                            ForEach(stock.data.prefix(prefixNum), id: \.symbol) { stockdata in
                                StockColumnBodyView(stockData: stockdata)
                            }
                        } else {
                            //ProgressView().tint(.green)
                            ForEach(MockStock.MOCK_STOCK.prefix(8)) { stock in
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
                        .frame(maxWidth: .infinity)
                        .shadow(color: Color(.systemGreen).opacity(0.2), radius: 10, x: 0, y: 10)
                )
            }
            .ignoresSafeArea(edges: .horizontal)
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
            .onAppear{
                NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { _ in
                    isLandscape = UIDevice.current.orientation.isLandscape
                }
            }
            .onDisappear {
                NotificationCenter.default.removeObserver(UIDevice.orientationDidChangeNotification)
            }
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}


