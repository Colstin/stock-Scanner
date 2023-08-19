//
//  ActiveButtonComponent.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/19/23.
//

import SwiftUI

struct ActiveButtonComponent: View {
    var body: some View {
        HStack{
            Text("Active")
                .foregroundColor(.green)
                
            Image(systemName: "pencil.circle")
                .font(.system(size: 20))
                .foregroundColor(Color("greywhite"))
        }
        .bold()
    }
}

struct ActiveButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        ActiveButtonComponent()
    }
}
