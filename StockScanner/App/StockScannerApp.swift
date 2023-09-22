//
//  StockScannerApp.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/8/23.
//

import SwiftUI

@main
struct StockScannerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

/*
 MARK: Summary
 1. Dont go below 30 for the prefix its a weird glitch, it'll mess up background
 
 TODO: Complete these
 0. uncomment Init() to see data we
 1. get stock price to populate onto my api list
 2. Need to test the Market Movers call for quality
 
 */




/*

 
 Adding functions inside SwiftUI Elements:
 
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
