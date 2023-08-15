//
//  LegalNoticeView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/15/23.
//

import SwiftUI

struct LegalNoticeView: View {
    var body: some View {
        Text("Please note that the information provided in the Scanners is for educational purposes only and should NOT be considered as professional financial or investment advice. The Scans present are not a licensed by a professional broker, and you should consult with a qualified financial advisor or professional before making any investment decisions.")
            .multilineTextAlignment(.center)
            .padding()
            .font(.system(size: 13))
            .foregroundColor(.gray)
            .frame(maxWidth: 500)
            .border(.gray)
            .padding(.top, 40)
            .padding(.horizontal)
    }
}

struct LegalNoticeView_Previews: PreviewProvider {
    static var previews: some View {
        LegalNoticeView()
    }
}
