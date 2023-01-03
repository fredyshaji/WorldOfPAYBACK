//
//  TransactionsListView.swift
//  WorldOfPAYBACKApp
//
//  Created by Fredy Shaji on 2022-12-17.
//

import SwiftUI

struct TransactionsListView: View {

    @StateObject var viewModel = TransactionsListVM()
    @StateObject var networkMonitor = NetworkMonitor()
    @State var selected: String =  "All"
    var transactionList: [TransactionsRowViewModel]

    var body: some View {
        NavigationView {
            VStack {
                TopBarView()
                Spacer()
                if networkMonitor.isConnected {
                    if viewModel.transactionList.isEmpty {
                        Text("Failed to fetch")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular, design: .rounded))
                        Spacer()
                    } else {
                        FilterView(selectedItem: $selected, items: viewModel.categories)
                            .padding(7)
                            .padding(.horizontal, 15)
                            .border(.background)

                        ZStack {
                            Color(.secondarySystemBackground)

                            if viewModel.isRefreshing {
                                HStack(spacing: 15) {
                                    ProgressView()
                                    Text("Loading…")
                                }
                            } else {
                                List(viewModel.transactionModelList.filter { $0.category == selected || selected == "All" }) { transaction in
                                    NavigationLink {
                                        TransactionDetailView(transaction: transaction)
                                    } label: {
                                        TransactionRow(transaction: transaction)
                                    }
                                }
                            }
                        }
                        TotalView(totalAmount: viewModel.findTotal(for: selected), currency: viewModel.transactionModelList.first?.currency ?? "")
                    }
                } else {
                    Text("Internet not available")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .regular, design: .rounded))
                    Spacer()
                }
            }
            .onAppear {
                networkMonitor.start()
            }
            .onDisappear {
                networkMonitor.stop()
            }
        }
    }
}

struct TransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsListView(transactionList: testDataList)
    }
}
