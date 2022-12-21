//
//  Responses.swift
//  WorldOfPAYBACKApp
//
//  Created by Fredy Shaji on 2022-12-12.
//

import Foundation

struct TransactionResponse: Decodable {

    let list: [Item]

    struct Item: Decodable {
        let partnerDisplayName: String
        let alias: Alias
        let category: Int
        let transactionDetail: TransactionDetail

        init(item: TransactionResponse.Item) {
            partnerDisplayName = item.partnerDisplayName
            alias = item.alias
            category = item.category
            transactionDetail = item.transactionDetail
        }

        init(partnerDisplayName: String, reference: String, category: Int, description: String, bookingDate: String, amount: Int, currency: String) {
            let value = TransactionValue(amount: amount, currency: currency)
            let detail = TransactionDetail(description: description, bookingDate: bookingDate, value: value)
            let alias =  Alias(reference: reference)
            self.partnerDisplayName = partnerDisplayName
            self.alias = alias
            self.category = category
            self.transactionDetail = detail
        }
    }

    struct Alias: Codable {
        let reference: String
        
        init(reference: String) {
            self.reference = reference
        }
    }

    struct TransactionDetail: Codable {
        let description: String?
        let bookingDate: String
        let value: TransactionValue
        
        init(description: String, bookingDate: String?, value: TransactionValue) {
            self.description = description
            self.bookingDate = bookingDate ?? ""
            self.value = value
        }
    }

    struct TransactionValue: Codable {
        let amount: Int
        let currency: String
        
        init(amount: Int, currency: String) {
            self.amount = amount
            self.currency = currency
        }
    }

    init(item: [Item]) {
      self.list = item
    }

}
