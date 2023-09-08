//
//  ScanViewModel.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/20/23.
//

import Foundation

@MainActor
class ScanViewModel: ObservableObject {
    @Published var stock: Stock?
    
    init (){
      //fetchStock()
    }
    
   
    func fetchStock() {
        Task {
            do {
                self.stock = try await getStock()
            } catch StockError.invalidURL{
                print("DEBUG: url issue")
            } catch StockError.invalidResponse{
                print("DEBUG: response issue")
            } catch StockError.invalidData{
                print("DEBUG: data issue")
            } catch {
                print("DEBUG: unexpected issue")
            }
        }
    }
    
  
    func getStock() async throws -> Stock  {
        let headers = [
            "X-RapidAPI-Key": "8961206d8cmsh9d61f46c89a5b1bp175481jsnc56c24646245",
            "X-RapidAPI-Host": "twelve-data1.p.rapidapi.com"
        ]
        
        let stockURL = "https://twelve-data1.p.rapidapi.com/stocks?exchange=NASDAQ&format=json"
        
        guard let encodedURL = stockURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: encodedURL) else {
            throw StockError.invalidURL
        }
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw StockError.invalidResponse }
        
        do {
            return try JSONDecoder().decode(Stock.self, from: data)
        } catch {
            throw StockError.invalidData
        }
    }
    
}


//  if let dataString = String(data: data, encoding: .utf8){
//print(dataString)
//}
