//
//  TopBarView.swift
//  WorldOfPAYBACKApp
//
//  Created by Fredy Shaji on 2022-12-21.
//

import SwiftUI

struct TopBarView: View {
    var body: some View {
        HStack {
            Image(systemName: "circle")
                .resizable()
                .frame(width: 10, height: 10, alignment: .top)
                .foregroundColor(.white)
            Text("PAYBACK")
                .font(.system(size: 35, weight: .heavy, design: .default))
                .foregroundColor(.white)
            Spacer()
        }
        .padding()
        .background(LinearGradient(colors: [.cyan, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
    }
}
