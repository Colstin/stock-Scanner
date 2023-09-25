//
//  TradingViewHTML.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/23/23.
//

import Foundation
import SwiftUI

struct TradingViewHTML {
    static let tradingViewHTML: String = """
            <!DOCTYPE html>
            <html>
            <head>
                <meta charset="UTF-8">
                <title>TradingView Widget</title>
            </head>
            <body>
                <!-- TradingView Widget BEGIN -->
                <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-screener.js" async>
                {
                "width": "100%",
                "height": "1000",
                "defaultColumn": "overview",
                "defaultScreen": "most_capitalized",
                "showToolbar": true,
                "locale": "en",
                "market": "us",
                "colorTheme": "dark",
                "isTransparent": false
                }
                </script>
                </body>
                </html>
            """
    
    
    static func generateTickerTapeHTML(_ colorScheme: ColorScheme) -> String {
        let backgroundColor: String
        let colorTheme: String
        
        if colorScheme == .dark {
            backgroundColor = "black"
            colorTheme = "dark"
        } else {
            backgroundColor = "white"
            colorTheme = "light"
        }
        
        let tickerTapeHTML: String = """
               <!DOCTYPE html>
               <html>
               <head>
                   <meta charset="UTF-8">
                   <title>TradingView Widget</title>
              <style>
                  body {
                      background-color: \(backgroundColor);
                  }
                
              </style>
               </head>
               <body>
               <!-- TradingView Widget BEGIN -->
             
       <div class="tradingview-widget-container" style="height: 200px;">
       <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-ticker-tape.js" async>
                 {
                 "symbols": [
                   {
                     "proName": "FOREXCOM:SPXUSD",
                     "title": "S&P 500"
                   },
                   {
                     "proName": "FX_IDC:EURUSD",
                     "title": "EUR to USD"
                   },
                   {
                     "proName": "BITSTAMP:BTCUSD",
                     "title": "Bitcoin"
                   },
                   {
                     "proName": "BITSTAMP:ETHUSD",
                     "title": "Ethereum"
                   },
                   {
                     "description": "Gold",
                     "proName": "OANDA:XAUUSD"
                   }
                 ],
                 "showSymbolLogo": true,
                 "colorTheme": "\(colorTheme)",
                 "isTransparent": false,
                 "displayMode": "adaptive",
                 "locale": "en"
               }
                 </script>
               </div>
               <!-- TradingView Widget END -->
                   </body>
                   </html>
       """
        
        return tickerTapeHTML
    }
}

