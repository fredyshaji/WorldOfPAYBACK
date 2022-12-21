//
//  TransactionsListView.swift
//  WorldOfPAYBACKApp
//
//  Created by Fredy Shaji on 2022-12-17.
//

import SwiftUI

struct TransactionsListView: View {

    @Binding var text: String
    @StateObject var viewModel = TransactionsListVM()
    @State var selected: String =  "All"
    var transactionList: [TransactionsRowViewModel]

    var body: some View {
        NavigationView {
            VStack {
                TopBarView()
                FilterView(selectedItem: $selected, items: viewModel.categories)
                
                TextField("Search...", text: $text)
                    .padding(7)
                    .background(Color(uiColor: .systemGray5))
                    .cornerRadius(12)
                    .padding(.horizontal, 15)
                
                ZStack {
                    Color(.secondarySystemBackground)
                    
                    List(viewModel.transactionModelList.filter { $0.category == selected || selected == "All" }) { transaction in
                        NavigationLink {
                            TransactionDetailView(transaction: transaction)
                        } label: {
                            TransactionRow(transaction: transaction)
                        }
                    }
                    
                }
            }
        }
    }
}

struct TransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsListView(text: .constant(""), transactionList: testDataList)
    }
}
