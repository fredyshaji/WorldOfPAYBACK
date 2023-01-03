//
//  NetworkMonitor.swift
//  WorldOfPAYBACKApp
//
//  Created by Fredy Shaji on 2023-01-02.
//

import Network
import SwiftUI

final class NetworkMonitor: ObservableObject {
    @Published private(set) var isConnected = false
    
    private let nwMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue.global()
    
    public func start() {
        nwMonitor.start(queue: workerQueue)
        nwMonitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
            }
        }
    }
    
    public func stop() {
        nwMonitor.cancel()
    }
}
