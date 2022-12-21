//
//  TransactionDetailView.swift
//  WorldOfPAYBACKApp
//
//  Created by Fredy Shaji on 2022-12-21.
//

import SwiftUI

struct TransactionDetailView: View {

    @StateObject var viewModel = TransactionsListVM()
    var transaction: TransactionsRowViewModel

    var body: some View {
            VStack {
                TopBarView()
                
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
                            Text(transaction.transactionDetailDescription ?? "")
                                .foregroundColor(.secondary)
                                .font(.system(size: 18, weight: .medium, design: .rounded))
                            Spacer()
                        }
                    }
                }
                .padding()
                Spacer()
            }
    }
}

struct TransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailView(transaction: testData)
    }
}
