//
//  ScanViewModel.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/20/23.
//

import Foundation

@MainActor
class ScanViewModel: ObservableObject {
    @Published var stock: [MostWatched] = []
   // @Published var errorMessage: String? //use this later to add error message to UI
    
    init (){
       //fetchStock()
    }
    
   
    func fetchStock() {
        Task {
            do {
                self.stock = try await getStock()
            } catch StockError.invalidURL{
                print("Error: \(StockError.invalidURL.localizedDescription)")
            } catch StockError.invalidResponse{
                print("Error: \(StockError.invalidResponse.localizedDescription)")
            } catch StockError.invalidData{
                print("Error: \(StockError.invalidData.localizedDescription)")
            } catch {
                print("Error: \(StockError.unkown(error).localizedDescription)")
            }
        }
    }
    
  
    func getStock() async throws -> [MostWatched]  {
        let headers = [
            "X-RapidAPI-Key": "8961206d8cmsh9d61f46c89a5b1bp175481jsnc56c24646245",
            "X-RapidAPI-Host": "yahoo-finance15.p.rapidapi.com"
        ]
        
        let stockURL = "https://yahoo-finance15.p.rapidapi.com/api/yahoo/tr/trending"
        guard let encodedURL = stockURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: encodedURL) else {
            throw StockError.invalidURL
        }
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw StockError.invalidResponse }

        do {
            let result = try JSONDecoder().decode([MostWatched].self, from: data)
            return result
        } catch {
            throw StockError.invalidData
        }
    }
    
}



