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
            StockListView(viewModel: viewModel, isLandscape: $isLandscape, prefixNum: prefixNum, columns: columns)
                .navigationTitle("Gap Scanner")
                .navigationBarTitleDisplayMode(.inline)
                //.toolbarBackground(Color(.systemCyan), for: .navigationBar)
                //.toolbarBackground(.visible, for: .navigationBar)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            print("Edit Button")
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(Color(.systemGray))
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


