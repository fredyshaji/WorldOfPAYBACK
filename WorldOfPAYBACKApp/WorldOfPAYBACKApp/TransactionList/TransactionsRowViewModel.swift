//
//  TransactionsRowViewModel.swift
//  WorldOfPAYBACKApp
//
//  Created by Fredy Shaji on 2022-12-18.
//

import Foundation
import SwiftUI

struct TransactionsRowViewModel: Identifiable {
    private let item: TransactionResponse.Item
    
    var id: String {
        return String(item.alias.reference)
    }
    
    var bookingDate: String {
        return ISO8601DateFormatter().date(from: item.transactionDetail.bookingDate)?.formatted() ?? ""
    }
    
    var partnerDisplayName: String {
        return item.partnerDisplayName
    }
    
    var transactionDetailDescription: String? {
        return item.transactionDetail.description
    }
    
    var amount: String {
        return String(item.transactionDetail.value.amount)
    }
    
    var currency: String {
        return item.transactionDetail.value.currency
    }

    var category: String {
        return "\(item.category)"
    }
    
    init(item: TransactionResponse.Item) {
        self.item = item
    }
}

#if DEBUG
let itemOne = TransactionResponse.Item(partnerDisplayName: "REWE Group",
                                     reference: "795357452000810",
                                     category: 1,
                                     description: "Punkte sammeln",
                                     bookingDate: "2022-07-24T10:59:05+0200",
                                     amount: 124,
                                     currency: "PBP")
let itemTwo = TransactionResponse.Item(partnerDisplayName: "OTTO Group",
                                     reference: "094844835601044",
                                     category: 2,
                                     description: "",
                                     bookingDate: "2022-07-22T10:59:05+0200",
                                     amount: 53,
                                     currency: "PBP")
let testData: TransactionsRowViewModel = TransactionsRowViewModel(item: itemOne)
let testDataList : [TransactionsRowViewModel] = [ TransactionsRowViewModel(item: itemOne),
                                                  TransactionsRowViewModel(item: itemTwo)]
#endif
