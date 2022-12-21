//
//  FilterItemView.swift
//  WorldOfPAYBACKApp
//
//  Created by Fredy Shaji on 2022-12-21.
//

import SwiftUI

struct FilterItemView: View {
    let filterCategory: String
    @Binding var selectedFilter: Bool
    var body: some View {
        VStack(spacing: 0.0) {
            Text(filterCategory)
                .font(.system(size: 12.0))
                .foregroundColor(selectedFilter ? .black : .gray)
                .padding(.horizontal, 16)
            if selectedFilter {
                Rectangle()
                    .frame(height: 2.0)
                    .foregroundColor(.orange)
            }
        }
    }
}

struct FilterItemView_Previews: PreviewProvider {
    static var previews: some View {
        FilterItemView(filterCategory: "3", selectedFilter: .constant(false))
    }
}
