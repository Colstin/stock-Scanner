//
//  ContentView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/8/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear(){
            Task {
                await apiCall()
            }
        }
    }
    
    func apiCall() async {
        let headers = [
            "X-RapidAPI-Key": "8961206d8cmsh9d61f46c89a5b1bp175481jsnc56c24646245",
            "X-RapidAPI-Host": "mboum-finance.p.rapidapi.com"
        ]
        
        if let url = URL(string: "https://mboum-finance.p.rapidapi.com/co/collections/most_actives?start=0"){
           
            var request = URLRequest(url: url)
            //headers
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
