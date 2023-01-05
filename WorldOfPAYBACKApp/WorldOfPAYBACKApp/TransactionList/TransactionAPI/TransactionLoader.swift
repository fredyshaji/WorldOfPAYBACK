//
//  TransactionLoader.swift
//  WorldOfPAYBACKApp
//
//  Created by Fredy Shaji on 2022-12-12.
//

import Foundation
import Combine

class TransactionLoader {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
      self.session = session
    }

    let filename = "PBTransactions.json"

    func loadTransactions(fromJSON filename: String) -> AnyPublisher<TransactionResponse, TransactionError> {
        Bool.random() ? load(filename) : Fail(error: .network(description: "Failed to fetch"))
            .eraseToAnyPublisher()
    }

    func load<T: Decodable>(_ filename: String) -> AnyPublisher<T, TransactionError> {
        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("Couldn't find \(filename) in main bundle")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle: /n\(error)")
        }

        print(data)
        let decodedData: AnyPublisher<T, TransactionError> = decode(data)
        print(decodedData)
        return decodedData
    }

}
