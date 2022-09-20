//
//  ConfigModel.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/09/20.
//

import Foundation
import Combine
import CoreDataConfig
class ConfigModel: ObservableObject {
    @Published var items: [Config] = [Config]()
    private var cancellable: AnyCancellable?
    init(itemsPublisher: AnyPublisher<[Config], Never> = ConfigStorage.shared.items.eraseToAnyPublisher()) {
        cancellable = itemsPublisher.sink { items in
            self.items = items
        }

    }
}
