//
//  ScanViewModel.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/20/23.
//

import Foundation

@MainActor
class ScanViewModel: ObservableObject {
    // @Published var errorMessage: String? //use this later to add error message to UI
    @Published var stock: [MostWatched] = []
    @Published var quotes: [String: StockQuote] = [:]
    @Published var stockScreener: [StockScreener] = []
    
    init (){
       fetchStock()
    }
    
   
    func fetchStock() {
        Task {
            do {
                self.stockScreener = try await getScreenerStocks()
                
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
    
    func getScreenerStocks() async throws -> [StockScreener] {
    
        var endpointComponents = URLComponents(string: APIConfig.apiURLFM)
        endpointComponents?.queryItems = [
            URLQueryItem(name: "priceLowerThan", value: "25"),
            URLQueryItem(name: "priceMoreThan", value: "0.50"),
            URLQueryItem(name: "volumeMoreThan", value: "500000"),
            URLQueryItem(name: "isEtf", value: "false"),
            URLQueryItem(name: "Country", value: "US"),
            URLQueryItem(name: "exchange", value: "NASDAQ"),
            URLQueryItem(name: "limit", value: "1000"),
            URLQueryItem(name: "apikey", value: APIConfig.apiKeyFM)
        ]
        
        guard let endpoint = endpointComponents?.url else { throw StockError.invalidURL }

        var request = URLRequest(url: endpoint, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = APIConfig.headers
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw StockError.invalidResponse }
        
        do {
            let result = try JSONDecoder().decode([StockScreener].self, from: data).sorted(by: { $0.volume > $1.volume })
            return result
        } catch {
            throw StockError.invalidData
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

    func getStockQuotes(symbols: [String]) async throws -> [String: StockQuote] {
        var quotesDictionary = [String: StockQuote]()
        
        let headers = [
            "X-RapidAPI-Key": "8961206d8cmsh9d61f46c89a5b1bp175481jsnc56c24646245",
            "X-RapidAPI-Host": "realstonks.p.rapidapi.com"
        ]
        
        for symbol in symbols {
            let baseURL = "https://realstonks.p.rapidapi.com/"
            let symbolURL = baseURL + symbol
            
            guard let url = URL(string: symbolURL) else { throw StockError.invalidURL }
            
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw StockError.invalidResponse }
            
            do {
                let quote = try JSONDecoder().decode(StockQuote.self, from: data)
                quotesDictionary[symbol] = quote
                print("\(symbol)")
                print("\(quote)")
            } catch {
                throw StockError.invalidData
            }
        }
        return quotesDictionary
    }

}



