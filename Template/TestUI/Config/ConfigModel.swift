//
//  ConfigModel.swift
//  Template
//
//  Created by vitus on 2022/04/22.
//

import Foundation
import Combine
import LSSLibrary

class ConfigModel : ObservableObject {
    @Published var items: [Config] = [Config]()
    private var cancellable : AnyCancellable?
    
    init(itemsPublisher : AnyPublisher<[Config], Never> = ConfigStorage.shared.items.eraseToAnyPublisher()) {

        cancellable = itemsPublisher.sink { items in
            self.items = items 
        }

    }
}
