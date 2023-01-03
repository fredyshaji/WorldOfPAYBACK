//
//  TotalView.swift
//  WorldOfPAYBACKApp
//
//  Created by Fredy Shaji on 2023-01-03.
//

import SwiftUI

struct TotalView: View {
    var totalAmount: String
    var currency: String
    var body: some View {
        HStack {
            Text("Total:")
                .font(.system(size: 18, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
                .padding(20)
            Spacer()
            HStack {
                Text(totalAmount)
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                Text(currency)
                    .font(.system(size: 18, weight: .light, design: .rounded))
                    .foregroundColor(.white)
            }
            .padding(20)
        }
        .border(.quaternary)
        .background(LinearGradient(colors: [.cyan, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct TotalView_Previews: PreviewProvider {
    static var previews: some View {
        TotalView(totalAmount: "100", currency: "PBP")
    }
}
