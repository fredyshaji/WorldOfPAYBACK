//
//  TransactionError.swift
//  WorldOfPAYBACKApp
//
//  Created by Fredy Shaji on 2022-12-12.
//

import Foundation

enum TransactionError: Error {
    case parsing(description: String)
    case network(description: String)
}
