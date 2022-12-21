//
//  TransactionRow.swift
//  WorldOfPAYBACKApp
//
//  Created by Fredy Shaji on 2022-12-18.
//

import SwiftUI

struct TransactionRow: View {
    var transaction : TransactionsRowViewModel
    var body: some View {
        ZStack(alignment: .leading) {
//            Rectangle()
//                .fill(Gradient(colors: [.blue, .cyan]))
//                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text(transaction.bookingDate)
                    .font(.caption)
                Text(transaction.partnerDisplayName)
                    .font(.title)
                Text(transaction.transactionDetailDescription ?? "")
                    .font(.headline)
                HStack {
                    Text("Amount")
                    Text(transaction.amount)
                    Text(transaction.currency)
                }
            }
        }
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transaction: testData)
    }
}
