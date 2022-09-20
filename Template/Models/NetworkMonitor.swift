//
//  NetworkMonitor.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/09/05.
//

import Foundation
import Network
public class NetworkMonitor: ObservableObject {
     @Published public var isConnected: Bool = false

    init() {
        let monitor = NWPathMonitor()
       // let cellMonitor = NWPathMonitor(requiredInterfaceType: .cellular) .wifi
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("We're connected")
                self.isConnected = true
           } else {
                print("No connection")
                self.isConnected = false
            }
            print(path.isExpensive)
        }
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
}
