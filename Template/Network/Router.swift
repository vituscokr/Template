//
//  Route.swift
//  Susuda
//
//  Created by Gyeongtae Nam on 2022/01/07.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit
import Combine

// Request Error 정의
enum RequestError: Error {
    case requestNoSuccess
    case requestError(message: String)
    case requestFailError(error: Error)
}
enum Router: URLConvertible {
    case latestPhotos(String)
    var baseURL: String {
        return AppConstant.severURL
    }
    var path: String {
        switch self {
        case .latestPhotos(let rover): return "/v1/rovers/\(rover)/latest_photos"
        }
    }
    var httpMethod: HTTPMethod {
        switch self {
        case .latestPhotos: return .get
        }
    }
    // AuthInterceptor 로 치환
    var headers: HTTPHeaders? {
        return HTTPHeaders()
    }
    // JSONEncoding.default
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    func asURL() throws -> URL {
        // 10분전에 무조건 토큰을 갱신 합니다.
        let url = baseURL  + path
        let encodedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let urlComponent = URLComponents(string: encodedURL)!
        return urlComponent.url!
    }
    /*
    func request(parameters: Parameters? = nil , onCompletedHandler:@escaping(_ data:JSON?, RequestError?) ->()) {
//
//

        APIManager.shared.session.request(self, method: self.httpMethod,
     parameters: parameters, encoding: self.encoding, headers: self.headers)
           // .validate(statusCode: 200..<300)
            .responseDecodable(of:JSON.self ) { response in


//                Debug.log("arg:\(String(describing: parameters))")
//                Debug.log("request: \(String(describing: response.request))")
//                Debug.log("response: \(String(describing: response.response))")
//                Debug.log("result: \(response.result)")
//                Debug.log("data: \(String(describing: response.data))")
//                Debug.log("headers: \(String(describing: headers))")

//                if response.response?.statusCode == 401 {
//                    Debug.log("This is request statusCode ")
//                    if User.shared.isLogin {
//                        User.shared.logout()
//                    }
//                    return
//                }

                switch(response.result) {
                case .success(let value):

                    if let error = value["error"].string  , !error.isEmpty {
                        let message = value["message"].string ?? ""
                        let errorDetails = value["errorDetails"]
                        Debug.log(errorDetails)
                        onCompletedHandler(nil, RequestError.requestError(message: message))
                        return
                    }

                    let success  = value["success"].bool
                    if success == false {

                        if let message = value["message"].string , !message.isEmpty {
                            onCompletedHandler(nil, RequestError.requestError(message: message))
                       } else {
                            onCompletedHandler(nil, RequestError.requestNoSuccess)
                        }
                        return
                    }

                    let data = value["data"]
                    onCompletedHandler(data, nil)
                case .failure(let error ):

                    onCompletedHandler(nil, RequestError.requestFailError(error: error))

                }

        }

    }
*/

   // AnyPublisher<Result<JSON, AFError>, Never>
// https://stackoverflow.com/questions/63554713/using-alamofire-with-publishdecodable
//    func request<T:Decodable>(parameters: Parameters? = nil) -> AnyPublisher<Result<T, AFError>, Never>{
//        let publisher =  APIManager.shared.session.request(self, method:
//        self.httpMethod, parameters: parameters, encoding: self.encoding, headers: self.headers)
//            .publishDecodable(type:T.self)
//        return publisher.result()
//    }
        // https://brunch.co.kr/@tilltue/67
    func request<T: Decodable>(parameters: Parameters? = nil ) -> AnyPublisher<T, RequestError> {
        return APIManager.shared.session.request(self,
                                                 method: self.httpMethod,
                                                 parameters: parameters,
                                                 encoding: self.encoding,
                                                 headers: self.headers)
            .validate()
            .publishDecodable(type: T.self)
            .value()
            .mapError {
                RequestError.requestFailError(error: $0 as Error)
            }
            .eraseToAnyPublisher()
    }
}
