//
//  AuthInterceptor.swift
//  Susuda
//
//  Created by Gyeongtae Nam on 2022/01/10.
//

import Foundation
import Alamofire
import SwiftyJSON


class AuthInterceptor : RequestInterceptor {
    
    let retryLimit = 1
    let retryDelay: TimeInterval = 0
    
    func adapt(_ urlRequest: URLRequest,
               for session: Session,
               completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        let urlRequest = urlRequest
        
//        let accessToken = Config.shared.read(.accessToken)
//        let deviceId = Config.shared.read(.deviceId)
        
//        urlRequest.setValue("\(accessToken)", forHTTPHeaderField: "Authorization")
//        urlRequest.setValue("\(deviceId)", forHTTPHeaderField: "device-id")
        completion(.success(urlRequest))
    }
    func retry(_ request: Alamofire.Request,
               for session: Session,
               dueTo error: Error,
               completion: @escaping (RetryResult) -> Void) {
//        let statusCode = request.response?.statusCode
//        guard  statusCode == 401  else{
//            return completion(.doNotRetry)
//        }
//        Router.refreshToken.refreshToken { data, error in
//            if error != nil {
//              User.shared.logout()
//                completion(.doNotRetry)
//            }else if request.retryCount < self.retryLimit {
//                completion(.retryWithDelay(self.retryDelay))
//            }
//        }
    }
}
