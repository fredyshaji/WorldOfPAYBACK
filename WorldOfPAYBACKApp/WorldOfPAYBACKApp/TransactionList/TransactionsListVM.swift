//
//  TransactionsListVM.swift
//  WorldOfPAYBACKApp
//
//  Created by Fredy Shaji on 2022-12-17.
//

import Foundation
import Combine

class TransactionsListVM: ObservableObject {

    @Published var transactionList: [TransactionResponse.Item] = []
    @Published private(set) var isRefreshing = false
    let loader = TransactionLoader()
    let fileName = "PBTransactions.json"
    private var bag = Set<AnyCancellable>()
    
    init() {
        fetchTransactions()
    }

    func fetchTransactions() {
        loader.loadTransactions(fromJSON: fileName)
            .map { response in
                response.items.map(TransactionResponse.Item.init)
            }
            .sink { [weak self] res in
                print(res)
                defer { self?.isRefreshing = false }
                
                switch res {
                case .failure(_):
                    self?.transactionList = []
                default: break
                }
            } receiveValue: { [weak self] list in
                print(list)
                self?.transactionList = list
            }
            .store(in: &bag)
    }
}
