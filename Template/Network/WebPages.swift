//
//  WebPages.swift
//  Susuda
//
//  Created by Gyeongtae Nam on 2022/01/11.
//

import Foundation
import Alamofire


//if let url = URL(string: AppConstant.serverURL + "/page/signup/phone-auth") {
//
//    Debug.log(url)
//    let urlRequest = URLRequest(url:url)
//    webView?.load(urlRequest)
//}



enum WebPages : URLConvertible {

    //(pg계약전까지 흰 페이지만 뜸)핸드폰 본인인증 페이지 가져오기
    case phoneAuth
    /// 영수증 웹페이지
    case receipt(String)
    /// 결제용 웹페이지
    case payment(String)
    ///이용약관 웹페이지 (약관 타입[1: 서비스 이용약관, 2:개인정보처리방침, 3:개인정보 수집 및 이용동의서, 4: 마케팅 활용 수신 동의 및 광고성 정보 전송 동의서]
    case agreement(Int)
    
    case companyInfo
    case refund
    case productInfo
    
    
    
    var baseURL : String {
        
        switch(AppConstant.environment) {
        case .develop:
            return AppConstant.developServerURL
        case .stage:
            return AppConstant.stageServerURL
        case .release:
            return AppConstant.serverURL
        }
    }
    
    var path: String {
        switch(self) {
        case .phoneAuth: return "/page/signup/phone-auth"
        case .receipt(let job_id): return "/page/receipt?job_id=\(job_id)"
        case .payment(let order_no): return "/page/payment/request?order_no=\(order_no)"
        case .agreement(let index): return "/page/agreement/\(index)"
        case .companyInfo: return "/page/company-info"
        case .refund: return "/page/refund"
        case .productInfo: return "/page/product-info"
        
        
        }
    }

    var title: String {
        switch(self) {
        case .phoneAuth:
            return ""
        case .receipt(_) :
            return "수수다 영수증"
        case .payment(_):
            return ""
        case .agreement(let type) :
            switch(type) {
            case 1:
                return "서비스 이용약관"
            case 2:
                return "개인정보처리방침"
            case 3:
                return "개인정보 수집 및 이용 동의"
            case 4:
                return "마케팅 활용 및 광고성 정보 수신동의서"
            default:
                return ""
            }
        case .companyInfo:
            return "회사정보"
        case .refund:
            return "환불 및 예약변경 안내"
        case .productInfo:
            return "상품 제공 고시"
        }
    }
    
    func asURL() throws -> URL {
        let urlString = baseURL + path
        let url = URL(string: urlString)
        return url!
    }
    
    
    
    var request : URLRequest? {
        let urlString = baseURL + path
        guard let url = URL(string: urlString) else { return  nil }
        var urlRequest = URLRequest(url:url)
        let accessToken = Config.shared.read(key: .accessToken, initStr: "")
        urlRequest.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
        return urlRequest
    }
    

    
}
