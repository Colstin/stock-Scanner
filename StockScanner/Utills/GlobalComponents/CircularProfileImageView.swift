//
//  CircularProfileImageView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/15/23.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle.badge.plus")
                .resizable()
                .frame(width: 95, height: 80)
                .symbolRenderingMode(.palette)
                .foregroundStyle(Color(.systemBlue), Color(.systemGray3))
                .scaleEffect(x: -1, y: 1)
            
        }
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView()
    }
}
