//
//  Parsing.swift
//  WorldOfPAYBACKApp
//
//  Created by Fredy Shaji on 2022-12-12.
//

import Foundation
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, TransactionError> {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    decoder.assumesTopLevelDictionary = false
    
    return Just(data)
        .decode(type: T.self, decoder: decoder)
        .mapError { error in
                .parsing(description: error.localizedDescription)
        }
        .eraseToAnyPublisher()
}
