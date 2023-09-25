//
//  TapeWebView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/23/23.
//

import SwiftUI
import WebKit

struct TapeWebView: UIViewRepresentable {
    let htmlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
          uiView.loadHTMLString(htmlString, baseURL: nil)
      }
}
