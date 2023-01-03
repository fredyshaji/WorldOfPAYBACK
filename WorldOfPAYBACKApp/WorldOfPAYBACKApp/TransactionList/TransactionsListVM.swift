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
    @Published var categories: [String] = []
    @Published private(set) var isRefreshing = false
    let loader = TransactionLoader()
    let fileName = "PBTransactions.json"
    private var bag = Set<AnyCancellable>()
    
    init() {
        isRefreshing = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) { [self] in
            self.fetchTransactions()
               .sink() { self.mapResponse() }
               .store(in: &self.bag)
        }
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
        transactionModelList
            .sort { $0.bookingDate > $1.bookingDate }
        findCategories()
    }

    func findCategories() {
        var categoryArray = transactionList.map { "\($0.category)" }
        categoryArray = Array(Set(categoryArray)).sorted()
        categoryArray.insert("All", at: 0)
        categories = categoryArray
    }

    func findTotal(for category: String) -> String {
        let amountArray = transactionModelList.filter { $0.category == category || category == "All" }
        let total = amountArray.map({Int($0.amount) ?? 0}).reduce(0, +)
        return String(total)
    }
}
