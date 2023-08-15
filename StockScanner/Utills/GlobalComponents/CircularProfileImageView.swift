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
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .foregroundColor(Color(.systemGray4))
                .overlay(
                    Image(systemName: "pencil.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color("blackwhite"))
                        .offset(x: 20, y: -10), alignment: .bottomTrailing
                )   
        }
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView()
    }
}
