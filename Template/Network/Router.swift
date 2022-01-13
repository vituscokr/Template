//
//  Route.swift
//  Susuda
//
//  Created by Gyeongtae Nam on 2022/01/07.
//

import Foundation
import Alamofire
import SwiftyJSON

enum RequestError :Error {
    case requestNoSuccess
    case requestError(message:String)
    case requestFailError(error:Error)
}


enum  Router :URLConvertible {
    
    //####################################//
    //##           고객앱                 ##//
    //####################################//
    
    ///대분류의 중/소 분류
    case getCateMiddleSmall
    ///소분류 상세 정보
    case getCateSmall
    ///이름으로 소분류 검색
    case getCateByName
    ///소분류에 속한 자재 조회
    case getCateSmallCateMaterial
    ///긴급 중/소 분류
    case getCateEmergency
    ///소분류 Options 조회
    case getCateSamllOptions
    ///소분류 필수자재 가격 조회
    case getCateSmallMaterialPrice
    
    ///광고 배너목록
    case getMainBanners
    ///job 배너 목록-사용자 필요사항확인
    case getMainActionBanners
    ///추천인 등록
    case postReferer
    ///기타문의 등록
    case postMainCunsult
    ///대분류 목록
    case getMainServices
    
    
    ///(2차) 알림 읽음 확인
    case getAlramRead
    ///(완) 숙련공 배정 상세 조회
    case getAlaramMatchingTechnician
    
    
    ///신청내역 상세 조회
    case getJobDetails
    /// 예약 취소
    case postJobCancel
    ///평가하기
    case postJobReview
    ///(완) 신청내역 목록 조회 - 진행중
    case getJobList
    ///(완) 신청내역 목록 조회 - 완료됨
    case getJobListDone
    ///(완) 신청내역 목록 조회 - 취소됨
    case getJobListCancel
    
    ///신청서 상세내용 조회
    case getApplicationDetail // /customer/application-details
    ///신청서 목록 조회
    case getApplication         ///customer/my-applications
    ///(완) 신청서 작성
    case postApplication
    ///신청서 삭제
    case deleteApplication
    ///내가 지정한 주소 조회
    case getMyAddress  ///customer/my-address
    //희망날짜 유효성 확인
    case postDateCheck ///customer/job/application/date-check
    
    
    ///보관함의 신청서 접수+결제(사전결제처리)
    case postPaymentReception
    ///상담 후 접수결제
    case postPaymentInitial
    ///실측추가결제
    case postPaymentMeasuring
    ///시공 추가 결제
    case postPaymentService
    ///결제 완료 처리
    case postPaymentComplete
    ///결제 중단 처리
    case postPaymentAbort
    /// 묶음 후 최종결제금액 계산 (선택된 신청서에 따라)
    case getDispatchFree
    /// 가상계좌 정보 조회
    case postPaymentBank
    
    ///반려동물 목록 조회(미구현 - 우선순위 최하로..)
    ///거주형태 목록 조회(미구현 - 우선순위 최하로..)
    

    /// 회원  정보 (프로필 카드)
    case getProfile  //customer/profile-card
    /// 알림 수신 끄기/켜기
    case patchAlarm  //customer/alarm-agreement
    /// 회원정보 수정
    case patchMyInfo //customer/my-info
    /// 회원정보 조회
    case getMyInfo ///customer/my-info
    ///회원탈퇴
    case postCloseAccount ////customer/close-account
    
    ///게시글 목록 조회
    case getNoticeList ///customer/notice
    ///게시글 상세내용 죄회
    case getNoticeDetail(Int)  ///customer/notice
    /// 1:1 문의 상담분류 목록 조회
    case getQuestionType  ///customer/question/type
    ///  1:1 문의 등록
    case postQuestion ///customer/question
    ///문의 목록 조회
    case getQuestion ///customer/question
    ///문의 파일 업로드
    case postQuestionFileUpload ///customer/question/file
    /// 문의 상세 내용 조회
    case getQuestionDetail(Int) ///customer/question/detail/:idx

    
    /// 리뷰 목록 조회 (상세 정보 포함)
    case getMyReviewList
    ///리뷰 삭제
    case deleteMyReview
    
    ///발급 가능한 목록 조회
    case getReceipts  //customer/receipts
    ///자주 묻는 질문 목록
    case getFAQ//customer/faq
    ///자주 묻는 질문 상세 조회
    case getFAQDetail
    
    ///쿠폰 조회
    case getMyCoupons ///customer/my-coupons
    ///쿠폰등록 (사용안함)
    case postCoupon
    ///2차 개발 -> 포인트 사용내역
    case getPointUseList
    
    
    case refreshToken
    
    //####################################//
    //##            숙력공앱              ##//
    //####################################//
    
    //(필요?)알림 존재 여부 체크
    //case
    ///콜 알림 수신 여부 체크 , 내정보 조회
    case getTechMySettings
    ///콜 알림 수신 여부 수정
    case patchTechMySettings
    ///정산 금액 조회
    case getTechMoney
    /// 월별 일정 조회
    case getTechMonthSchedule
    /// 일별 일정 조회
    case getTechDailySchedule
    
    /// 일정 상세 내용 조회
    case getTechJobDetail
    /// 실측 시작
    case postTechStartMeasuring
    /// 실측 정보 입력 (= 실측 완료)
    case postTechEnterMeasuring
    /// 서비스 시작
    case postTechStartService
    /// 서비스 완료
    case postTechFinishService
    
    /// 콜 상세 내용 조회
    case getTechCallDetail
    /// 콜 응답
    case postTechCallAccept
    /// 이달의 정산 내역 조회
    case getTechCompletedList
    ///정산 내역 상세 보기 조회
    case getTechJobInvoice
    ///해당 달 정산 금액
    case getTechReceivableMoney
    ///공지사항 목록 조회
    case getTechNoticeList
    ///서비스 자격 검색
    case getTechSkillService
    ///공지사항 상세 조회
    case getTechNoticeDetail(Int)
    
    //####################################//
    //##            공통                 ##//
    //####################################//
    ///폴더 목록 조회
    case getFileFolder
    case deleteFolder
    case deleteFile
    case patchFile
    
    case postTechLogin
    case postLoginKakao
    case postLoginNaver
    case postLogin
    case postLoginManager
    case postLogout
    
    case getServiceArea
    case getCheckServiceArea
    case getBankList
    case getSeriveAreaDetail(Int)
    
    case postSignupKakao
    case postSignupNaver
    case postSignupApple
    case postSignup
    
    case patchFCMToken
    case postFCMSelfTest
    case getFCMHistory
    case patchFCMRead
    
    /// 로그인한 유저 정보
    case getCommonMyInfo
    ///폰번호로 가입 유형 조회
    case getSignupType
    ///비밀번호 변경
    case patchPassword
    /// 비밀번호 분실시 초기화 (핸드폰인증)
    case patchPasswordInit
    
    case patchThumbnail
    case deleteThumbnail
    
    case getFAQType
    ///환불계좌 등록 시 은행목록 조회
    
    case getRefundBanks
    case patchBank
    case deleteBank
    //사용자 문의 목록
    case getConsultation
    ///공통 - 계정(폰번호) 변경
    case patchPhoneNumber
    

    
    
    var baseURL : String {
        
        return "" 
//        switch(AppConstant.environment) {
//        case .develop:
//            return AppConstant.developServerURL
//        case .stage:
//            return AppConstant.stageServerURL
//        case .release:
//            return AppConstant.serverURL
//        }
        
    }
    var versionPath : String {
        
        return "/v1"
    }
    var path : String {
        switch(self) {
            
            case .refreshToken:                         return "/common/auth/refresh"
            
            
            case .getCateMiddleSmall:                   return "/customer/service-types"
            case .getCateSmall:                         return "/customer/job-category-details"
            case .getCateByName:                        return "/customer/job-category"
            case .getCateSmallCateMaterial:             return "/customer/job-category-materials"
            case .getCateEmergency:                     return "/customer/emergency-service-types"
            case .getCateSamllOptions:                  return "/customer/job-category-options"
            case .getCateSmallMaterialPrice:            return "/customer/job-category-materials-prices"
            
            case .getMainBanners:                       return "/customer/banners"
            case .getMainActionBanners:                 return "/customer/action-banners"
            case .postReferer:                          return "/customer/referrer"
            case .postMainCunsult:                      return "/customer/job/application/direct-consultation"
            case .getMainServices:                      return "/common/services"
            
            //TODO:
            case .getAlramRead:                         return ""
            case .getAlaramMatchingTechnician:          return "/customer/job/matching/technicians"
            
            case .getJobDetails:                        return "/customer/job-details"
            case .postJobCancel:                        return "/customer/job/cancel"
            case .postJobReview:                        return "/customer/job/review"
            case .getJobList:                           return "/customer/my-jobs/ongoing"
            case .getJobListDone:                       return "/customer/my-jobs/complete"
            case .getJobListCancel:                     return "customer/my-jobs/cancelled"
            
            
            case .getApplicationDetail:                 return "/customer/application-details"
            case .getApplication:                       return "/customer/my-applications"
            case .postApplication:                      return "/customer/job/application"
            case .deleteApplication:                    return "/customer/job/application"
            case .getMyAddress:                         return "/customer/my-address"
            case .postDateCheck:                        return "/customer/job/application/date-check"
            
            case .postPaymentReception:                 return "/customer/job/reception"
            case .postPaymentInitial:                   return "/customer/job/payment/initial"
            case .postPaymentMeasuring:                 return "/customer/job/payment/measuring"
            case .postPaymentService:                   return "/customer/job/payment/service"
            case .postPaymentComplete:                  return "/customer/payment/complete"
            case .postPaymentAbort:                     return "/customer/payment/abort"
            case .getDispatchFree:                      return "/customer/job/reception/dispatch-fees"
            case .postPaymentBank:                      return "/customer/payment/vbank"
            
            case .getProfile:                           return "/customer/profile-card"
            case .patchAlarm:                           return "/customer/alarm-agreement"
            case .patchMyInfo:                          return "/customer/my-info"
            case .getMyInfo:                            return "/customer/my-info"
            case .postCloseAccount:                     return "/customer/close-account"
            
            case .getNoticeList:                        return "/customer/notice"
            case .getNoticeDetail(let idx) :            return "/customer/notice/detail/\(idx)"
            case .getQuestionType:                      return "/customer/question/type"
            case .postQuestion:                         return "/customer/question"
            case .getQuestion:                          return "/customer/question"
            case .postQuestionFileUpload:               return "/customer/question/file"
            case .getQuestionDetail(let idx ):          return "/customer/question/detail/\(idx)"
        
            
            case .getMyReviewList:                      return "/customer/my-review-list"
            case .deleteMyReview:                       return "/customer/job/review"
            case .getReceipts:                          return "/customer/receipts"
            case .getFAQ:                               return "/customer/faq"
            case .getFAQDetail:                         return "/customer/faq"
            case .getMyCoupons:                         return "/customer/my-coupons"
            case .postCoupon:                           return "/customer/coupon"
            //TODO:
            case .getPointUseList:                      return ""
            
            
           
            case .getTechMySettings:                    return "/technician/my-settings"
            case .patchTechMySettings:                  return "/technician/my-settings"
            case .getTechMoney:                         return "/technician/money-to-receive"
            case .getTechMonthSchedule:                 return "/technician/monthly-schedule"
            case .getTechDailySchedule:                 return "/technician/daily-schedule"
            
            case .getTechJobDetail:                     return "/technician/job-details"
            case .postTechStartMeasuring:               return "/technician/start-measuring"
            case .postTechEnterMeasuring:               return "/technician/enter-measurements"
            case .postTechStartService:                 return "/technician/start-servicing"
            case .postTechFinishService:                return "/technician/finish-servicing"
            
            case .getTechCallDetail:                    return "/technician/call-details"
            case .postTechCallAccept:                   return "/technician/accept-call"
            
            case .getTechCompletedList:                 return "/technician/completed-services-list"
            case .getTechJobInvoice:                    return "/technician/job-invoice"
            case .getTechReceivableMoney:               return "technician/receivable-money-monthly"
            case .getTechNoticeList:                    return "/technician/notice"
            case .getTechSkillService:                  return "/technician/my-skills"
            case .getTechNoticeDetail (let idx) :       return "/technician/notice/detail/\(idx)"
            
            
            case .getFileFolder:                        return "/common/file"
            case .deleteFolder:                         return "/common/file/folder"
            case .deleteFile:                           return "/common/file"
            case .patchFile:                            return "/common/file"
            
            
            case .postTechLogin:                        return "/common/signin-technician/normal"
            case .postLoginKakao:                       return "/common/signin-customer/kakao"
            case .postLoginNaver:                       return "/common/signin-customer/naver"
            case .postLogin:                            return "common/signin-customer/normal"
            case .postLoginManager:                     return "/common/signin-admin/normal"
            case .postLogout:                           return "/common/logout"
            
            case .getServiceArea:                       return "/common/service-area"
            case .getCheckServiceArea:                  return "/common/check-area"
            case .getBankList:                          return "/common/banks"
            case .getSeriveAreaDetail(let id):          return "/common/service-area/\(id)"
            
            case .postSignupKakao:                      return "/common/signup-customer/kakao"
            case .postSignupNaver:                      return "/common/signup-customer/naver"
            case .postSignupApple:                      return "/common/signup-customer/apple"
            case .postSignup:                           return "/common/signup-customer/normal"
            
            case .patchFCMToken:                        return "/common/fcm/token"
            case .postFCMSelfTest:                      return "/common/fcm/self-check"
            case .getFCMHistory:                        return "common/fcm/notification-history"
            case .patchFCMRead:                         return "/common/fcm/notification/read"
            
            case .getCommonMyInfo:                      return "/common/myinfo"
            case .getSignupType:                        return "/common/signup-type"
            
            case .patchPassword:                        return "/common/pw"
            case .patchPasswordInit:                    return "/common/pw/init"
            case .patchThumbnail:                       return "/common/thumbnail/file"
            case .deleteThumbnail:                      return "/common/thumbnail/file"
            case .getFAQType:                           return "/common/faq/type"
            
            case .getRefundBanks:                       return "/common/refund-banks"
            case .patchBank:                            return "/customer/bank"
            case .deleteBank:                           return "/customer/bank"
            case .getConsultation:                      return "/customer/consultations"
            case .patchPhoneNumber:                     return "/common/person-id"
            
            
            
        }
        
    }
    var httpMethod : HTTPMethod {
        switch(self) {
            case .refreshToken:                         return .post
            
            case .getCateMiddleSmall:                   return .get
            case .getCateSmall:                         return .get
            case .getCateByName:                        return .get
            case .getCateSmallCateMaterial:             return .get
            case .getCateEmergency:                     return .get
            case .getCateSamllOptions:                  return .get
            case .getCateSmallMaterialPrice:            return .get
            
            case .getMainBanners:                       return .get
            case .getMainActionBanners:                 return .get
            case .postReferer:                          return .post
            case .postMainCunsult:                      return .post
            case .getMainServices:                      return .get
            
            case .getAlramRead:                         return .get
            case .getAlaramMatchingTechnician:          return .get //15
            
            case .getJobDetails:                        return .get
            case .postJobCancel:                        return .post
            case .postJobReview:                        return .post
            case .getJobList:                           return .get
            case .getJobListDone:                       return .get
            case .getJobListCancel:                     return .get

            case .getApplicationDetail:                 return .get
            case .getApplication:                       return .get
            case .postApplication:                      return .post
            case .deleteApplication:                    return .delete
            case .getMyAddress:                         return .get
            case .postDateCheck:                        return .post
            
            case .postPaymentReception:                 return .post
            case .postPaymentInitial:                   return .post
            case .postPaymentMeasuring:                 return .post
            case .postPaymentService:                   return .post
            case .postPaymentComplete:                  return .post
            case .postPaymentAbort:                     return .post
            case .getDispatchFree:                      return .get
            case .postPaymentBank:                      return .post
            
            case .getProfile:                           return .get
            case .patchAlarm:                           return .patch
            case .patchMyInfo:                          return .patch
            case .getMyInfo:                            return .get
            case .postCloseAccount:                     return .post //41
            
            case .getNoticeList:                        return .get
            case .getNoticeDetail(_) :            return .get
            case .getQuestionType:                      return .get
            case .postQuestion:                         return .post
            case .getQuestion:                          return .get
            case .postQuestionFileUpload:               return .post
            case .getQuestionDetail(_):          return .get
            
            case .getMyReviewList:                      return .get
            case .deleteMyReview:                       return .delete
            case .getReceipts:                          return .get
            case .getFAQ:                               return .get
            case .getFAQDetail:                         return .get
            case .getMyCoupons:                         return .get
            case .postCoupon:                           return .post
            case .getPointUseList:                      return .get
            
            
            
            case .getTechMySettings:                    return .get
            case .patchTechMySettings:                  return .patch
            case .getTechMoney:                         return .get
            case .getTechMonthSchedule:                 return .get
            case .getTechDailySchedule:                 return .get
            case .getTechJobDetail:                     return .get
            case .postTechStartMeasuring:               return .post
            case .postTechEnterMeasuring:               return .post
            case .postTechStartService:                 return .post
            case .postTechFinishService:                return .post
            
            case .getTechCallDetail:                    return .get
            case .postTechCallAccept:                   return .post
            case .getTechCompletedList:                 return .get
            case .getTechJobInvoice:                    return .get
            case .getTechReceivableMoney:               return .get
            case .getTechNoticeList:                    return .get
            case .getTechSkillService:                  return .get
            case .getTechNoticeDetail (_) :             return .get
            
            case .postSignupKakao:                      return  .post
            case .postSignupNaver:                      return  .post
            case .postSignupApple:                      return  .post
            case .postSignup:                           return .post
                
            case .patchFCMToken:                        return .patch
            case .postFCMSelfTest:                      return .post
            case .getFCMHistory:                        return .get
            case .patchFCMRead:                         return .patch
                    
            case .getCommonMyInfo :                     return .get
            case .getSignupType:                        return .get
                
            case .patchPassword:                        return .patch
            case .patchPasswordInit:                    return .patch
            case .patchThumbnail:                       return .patch
            case .deleteThumbnail:                      return .delete
            case .getFAQType:                           return .get
                
            case .getRefundBanks:                       return .get
            case .patchBank:                            return .patch
            case .deleteBank:                           return .delete
            case .getConsultation:                      return .get
            case .patchPhoneNumber:                     return .patch

            
            case .getFileFolder:                        return .get
            case .deleteFolder:                         return .delete
            case .deleteFile:                           return .delete
            case .patchFile:                            return .patch
            case .postTechLogin:                        return .post
            case .postLoginKakao:                       return .post
            case .postLoginNaver:                       return .post
            case .postLogin:                            return .post
            case .postLoginManager:                     return .post
            case .postLogout:                           return .post
            case .getServiceArea:                       return .get
            case .getCheckServiceArea:                  return .get
            case .getBankList:                          return .get
            case .getSeriveAreaDetail(_):               return .get
        }
        
    }
    

    //AuthInterceptor 로 치환
    var headers : HTTPHeaders? {
        
        //let accessToken = Config.shared.read(key: .accessToken, initStr: "")
//        let refreshToken = Config.shared.read(key: .refreshToken, initStr: "" )
//
//        let token : String
//        switch(self) {
//            case .refreshToken:
//                token = refreshToken.replacingOccurrences(of: "Bearer ", with: "")
//
//            default:
//                 token = ""  // AuthInterceptor 로 치환
//
//        }
//        var header: HTTPHeaders? = nil
//        if   token != ""   {
//            header = [
//                .authorization(bearerToken:token )
//            ]
//            let deviceId = Config.shared.read(key: .deviceId, initStr: "")
//            if deviceId != "" {
//                header?.add(name: "device-id", value: deviceId )
//            }
//        }
//        return header
        return nil
    }
    
    
    
    func asURL() throws -> URL {
        
        //10분전에 무조건 토큰을 갱신 합니다.
        let url = baseURL + versionPath + path
        let encodedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let urlComponent = URLComponents(string: encodedURL)!
        
        return urlComponent.url!
    }
    

    
    func request(parameters: Parameters? = nil , onCompletedHandler:@escaping(_ data:JSON?, RequestError?) ->()) {
        
        APIManager.shared.session.request(self, method: self.httpMethod, parameters: parameters)
            .validate(statusCode: 200..<300)
            .responseDecodable(of:JSON.self ) { response in
                
                
//                Debug.log("arg:\(String(describing: parameters))")
//                Debug.log("request : \(String(describing: response.request))")
//                Debug.log("response : \(String(describing: response.response))")
//                Debug.log("result: \(response.result)")
//                Debug.log("data : \(String(describing: response.data))")
//                Debug.log("headers : \(String(describing: headers))")

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
                        onCompletedHandler(nil, RequestError.requestNoSuccess)
                        return
                    }
                  
                    let data = value["data"]
                    onCompletedHandler(data, nil)
                case .failure(let error ):

                    onCompletedHandler(nil, RequestError.requestFailError(error: error))
                    
                }
                
        }

    }

    
    
    func refreshToken(onCompletedHandler:@escaping(_ data:JSON?, RequestError?) ->() ) {
        
        
        AF.request(self, method: self.httpMethod, headers: self.headers)
            .responseDecodable(of:JSON.self ) { response in
                
                //Debug.log("arg:\(String(describing: parameters))")
//                Debug.log("request : \(String(describing: response.request))")
//                Debug.log("response : \(String(describing: response.response))")
//                Debug.log("result: \(response.result)")
//                Debug.log("data : \(String(describing: response.data))")
//                Debug.log("headers : \(String(describing: headers))")
                
                
//                userid :01000000000
//                accessToken:Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwZXJzb25faWQiOiIwMDAwMDAwMC0wMDAwLTAwMDAtMDAwMC0wMDAwMDAwMDAwMDAiLCJ1c2VyX3R5cGUiOjEsImlhdCI6MTY0MTk2MTY5MiwiZXhwIjoxNjQxOTYzNDkyfQ.lzGZwVxQPgaWChXfWodl9R9PCnpdF0qKK7ZNNvg5WMM
//                expire:1641963492701
//                refreshToken:Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwZXJzb25faWQiOiIwMDAwMDAwMC0wMDAwLTAwMDAtMDAwMC0wMDAwMDAwMDAwMDAiLCJ0b2tlbl9pZCI6IjNiZWM2YWEyLTEyYTAtNDQzYy1iYmE0LTkyOGQ0NDEwMDI5YyIsInVzZXJfdHlwZSI6MSwiaWF0IjoxNjQxOTYxNjkyLCJleHAiOjE2NDI1NjY0OTJ9.h0K2uZPYCGbWQ-MJDm2PjEh3WKw6Pwe6kplTtGyN45s
//                refreshTokenExpire:1642566492701
                switch(response.result) {
                case .success(let data) :
                    if let error = data["error"].string  , !error.isEmpty {
                        let message = data["message"].string ?? ""
                        let errorDetails = data["errorDetails"]
//                        Debug.log(errorDetails)

                        onCompletedHandler(nil, RequestError.requestError(message: message))
                        return
                    }
                    
                    let success  = data["success"].bool
                    if success == false {
                        onCompletedHandler(nil, RequestError.requestNoSuccess)
                        return
                    }
                    
                    let refreshToken = data["data"]["refreshToken"].string ?? ""
                    let accessToken = data["data"]["accessToken"].string ?? ""
                    let expires = data["data"]["accessTokenExpiredAt"].int ?? 0
                    let expireRefresh = data["data"]["refreshTokenExpiredAt"].int ?? 0
                    
//                    Debug.log(refreshToken)
//                    Debug.log(accessToken)
//                    Debug.log(expires)
//                    Debug.log(expireRefresh)
                    
                    guard refreshToken != "" , accessToken != "" else {
                        onCompletedHandler(nil, RequestError.requestNoSuccess)
                        return 
                    }


//                    Config.shared.save(key: .accessToken, value: accessToken)
//                    Config.shared.save(key: .refreshToken, value: refreshToken)
//                   // Config.shared.save(key: .username, value: username)
//                    Config.shared.save(key: .tokenExpires, value: String(expires))
//                    Config.shared.save(key: .tokenRefreshExpires, value: String(expireRefresh))
                    
                    onCompletedHandler(data , nil )
                    
                case .failure(let error):
                    onCompletedHandler(nil, RequestError.requestFailError(error: error))
                }
            }
        
    }

}
