//
//  ScanViewModel.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/20/23.
//

import Foundation

class ScanViewModel: ObservableObject {
    @Published var mostActiveStock = [MostActiveStock]()
    
    let headers = [
        "X-RapidAPI-Key": "8961206d8cmsh9d61f46c89a5b1bp175481jsnc56c24646245", 
        "X-RapidAPI-Host": "mboum-finance.p.rapidapi.com"
    ]
    //forHTTPHeaderField = key in the headers dictionary
    
    func apiCall() async {
        // 1. URL
        if let url = URL(string: "https://mboum-finance.p.rapidapi.com/co/collections/most_actives?start=0"){
            
            // 2. headers
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
            // 3. URL Session
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
 
                if let dataString = String(data: data, encoding: .utf8){
                    print(dataString)
                }
            } catch {
                print("Debug api: \(error.localizedDescription)")
            }
        }
    }
}
