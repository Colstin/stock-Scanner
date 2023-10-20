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
    @Published var stockScreener: [StockScreener] = []
    @Published var additionalQuotesData = [AdditionalQuotesData]()
    @Published var fullStockData = [String: FullStockData]()   //symbol is the key and the FullStockData is the value.
    
    
    init (){
       fetchStock()
    }
    
   
    func fetchStock() {
        Task {
            do {
                self.stockScreener = try await getScreenerStocks()
                let symbols = stockScreener.map { $0.symbol }
                try await fetchAdditionalData(for: symbols)
                
                
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
            URLQueryItem(name: "limit", value: "3000"),
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
    
    
    func fetchAdditionalData(for symbols: [String]) async throws {
        do {
           if let batchRequestURL = constructBatchRequestURL(symbols: symbols) {
               let (batchData, batchResponse) = try await URLSession.shared.data(for: batchRequestURL)
               guard let batchResponse = batchResponse as? HTTPURLResponse, batchResponse.statusCode == 200 else { throw StockError.invalidResponse }
            
               let additionalQuotesData = try JSONDecoder().decode([AdditionalQuotesData].self, from: batchData).filter { $0.changesPercentage > 0 }
               
               updateQuotes(with: additionalQuotesData)
               
            } else {
                print("Failed to construct the batch request")
            }
            
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func constructBatchRequestURL(symbols: [String]) -> URLRequest? {
        let symbolList = symbols.joined(separator: ",")
        let urlString = "https://financialmodelingprep.com/api/v3/quote/\(symbolList)?apikey=\(APIConfig.apiKeyFM)"
        
        guard let batchRequestURL = URL(string: urlString) else {
            print("Error: Invalid batch request URL")
            return nil
        }
        
        var request = URLRequest(url: batchRequestURL, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = APIConfig.headers
        
        return request
    }


    func updateQuotes(with additionalQuoteData: [AdditionalQuotesData]) {
        for additionalQuote in additionalQuoteData {
            if let stockScreener = stockScreener.first(where: { $0.symbol == additionalQuote.symbol }){
                let updatedQuote = FullStockData (
                    symbol: additionalQuote.symbol,
                    companyName: stockScreener.companyName,
                    price: stockScreener.price,
                    volume: stockScreener.volume,
                    changesPercentage: additionalQuote.changesPercentage,
                    change: additionalQuote.change
                )
                
                fullStockData[additionalQuote.symbol] = updatedQuote
            }
        }
        
    }
}



