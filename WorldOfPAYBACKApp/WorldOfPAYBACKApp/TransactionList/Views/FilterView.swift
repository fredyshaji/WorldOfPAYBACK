//
//  FilterView.swift
//  WorldOfPAYBACKApp
//
//  Created by Fredy Shaji on 2022-12-21.
//

import SwiftUI

struct FilterView: View {
    @Binding var selectedItem: String
    var items: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                ForEach(items, id: \.self) { item in
                    FilterItemView(filterCategory: item, selectedFilter: .constant(item == selectedItem))
                        .onTapGesture {
                            selectedItem = item
                        }
                }
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(selectedItem: .constant("3"),
                    items: ["1","2","3","4"])
    }
}
