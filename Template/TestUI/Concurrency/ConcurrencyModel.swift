//
//  ConcurrencyModel.swift
//  Template
//
//  Created by vitus on 2022/04/22.
//

import Foundation
import Combine
import SwiftUI
import Alamofire
import SwiftyJSON
import LSSLibrary



class ConcurrencyModel : ObservableObject {
    
    private var disposeBag = Set<AnyCancellable>()
    
    @Published var photos = [MyItem]()
    
    init() {
        
    }
    
    func fetch() {
        
        let arg = [
            "api_key": AppConstant.apiKey
        ]
        
        let publisher : AnyPublisher<JSON, RequestError> =  Router.latestPhotos("curiosity").request(parameters: arg)
        
        publisher
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion  in
                switch(completion) {
                case .failure(let error):
                    Debug.log(error)
                case .finished:
                    Debug.log("success")
                }
            }, receiveValue: { value  in
                //
                guard let latestPhotos = value["latest_photos"].array else {
                    return
                }
                
                for photo in latestPhotos {
                    self.photos.append(MyItem(item: photo))
                }
                
                
            })
            .store(in: &disposeBag)
    }
    
    func fetch(rover: String , limit: Int = 0 ) {
        let arg = [
            "api_key": AppConstant.apiKey
        ]
        
        let publisher : AnyPublisher<JSON, RequestError> =  Router.latestPhotos(rover).request(parameters: arg)
        
        publisher
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion  in
                switch(completion) {
                case .failure(let error):
                    Debug.log(error)
                case .finished:
                    Debug.log("success")
                }
            }, receiveValue: { value  in
                //
                guard let latestPhotos = value["latest_photos"].array else {
                    return
                }
                
                if limit == 0 {
                    for photo in latestPhotos {
                        self.photos.append(MyItem(item: photo))
                    }
                } else {
                    for (index,photo)  in latestPhotos.enumerated() {
                        
                        if index == limit  {
                            break
                        }
                        self.photos.append(MyItem(item: photo))
                        
                        
                    }
                }
                
                
            })
            .store(in: &disposeBag)
    }
    
    
    func fetchAll() {
        
        fetch(rover: "curiosity" , limit: 1)
        fetch(rover: "perseverance", limit: 1)
        fetch(rover: "spirit" , limit: 1)
        fetch(rover: "opportunity" , limit: 1)
        
    }
    
}
