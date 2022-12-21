//
//  TransactionsListVM.swift
//  WorldOfPAYBACKApp
//
//  Created by Fredy Shaji on 2022-12-17.
//

import Foundation
import Combine

class TransactionsListVM: ObservableObject {

    var transactionList: [TransactionResponse.Item] = []
    @Published var transactionModelList: [TransactionsRowViewModel] = []
    @Published private(set) var isRefreshing = false
    let loader = TransactionLoader()
    let fileName = "PBTransactions.json"
    private var bag = Set<AnyCancellable>()
    
    init() {
         fetchTransactions()
            .sink() { self.mapResponse() }
            .store(in: &self.bag)
    }

    func fetchTransactions() -> Future <Void, Never> {
        return Future() { promise in
            self.loader.loadTransactions(fromJSON: self.fileName)
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
                    promise(Result.success(()))
                }
                .store(in: &self.bag)
        }
        
    }
    
    func mapResponse() {
        transactionModelList = transactionList.map { transaction in
            TransactionsRowViewModel(item: transaction)
        }
    }
}
