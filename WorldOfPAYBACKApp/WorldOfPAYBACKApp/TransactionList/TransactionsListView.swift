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
    var transactionList: [TransactionsRowViewModel]

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "circle")
                    .resizable()
                    .frame(width: 10, height: 10, alignment: .top)
                    .foregroundColor(.white)
                Text("PAYBACK")
                    .font(.system(size: 35, weight: .bold, design: .default))
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
            .background(Color(.systemBlue))
            
            TextField("Search...", text: $text)
                .padding(7)
                .background(Color(uiColor: .systemGray5))
                .cornerRadius(12)
                .padding(.horizontal, 15)
               
            ZStack {
                Color(.secondarySystemBackground)
                List(transactionList) {
                    transaction in TransactionRow(transaction: transaction)
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
