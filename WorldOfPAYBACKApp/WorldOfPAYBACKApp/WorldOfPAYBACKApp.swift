//
//  WorldOfPAYBACKAppApp.swift
//  WorldOfPAYBACKApp
//
//  Created by Fredy Shaji on 2022-12-03.
//

import SwiftUI

@main
struct WorldOfPAYBACKApp: App {
    var body: some Scene {
        WindowGroup {
            TransactionsListView(transactionList: [])
        }
    }
}
