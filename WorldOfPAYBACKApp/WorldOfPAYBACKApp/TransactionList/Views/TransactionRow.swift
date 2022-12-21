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
            VStack(alignment: .leading) {
                HStack {
                    //You can set the respective company logo here
                    Image(systemName: "circle.grid.3x3.circle.fill")
                        .resizable()
                        .foregroundColor(.random())
                        .frame(width: 40, height: 40, alignment: .center)
                        .aspectRatio(contentMode: .fill)
                    VStack {
                        HStack {
                            Text(transaction.partnerDisplayName)
                                .foregroundColor(.blue)
                                .font(.system(size: 22, weight: .semibold, design: .rounded))
                            Spacer()
                        }
                        HStack {
                            Text(transaction.bookingDate)
                                .foregroundColor(.secondary)
                                .font(.system(size: 12, weight: .regular, design: .rounded))
                            Spacer()
                        }
                    }
                }
                
                Text(transaction.transactionDetailDescription ?? "")
                    .font(.system(size: 18, weight: .regular, design: .rounded))
                HStack {
                    Text("Amount:")
                        .font(.system(size: 18, weight: .regular, design: .rounded))
                    Text(transaction.amount)
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                    Text(transaction.currency)
                        .font(.system(size: 18, weight: .light, design: .rounded))
                }
            }
        }
//        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(7)
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transaction: testData)
    }
}
