//
//  APIRequest.swift
//  Social Media
//
//  Created by mac-0005 on 06/06/18.
//  Copyright © 2018 mac-0005. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SDWebImage


//MARK:- ---------BASEURL __ TAG

var BASEURL:String          =   "http://itrainacademy.in/baya-app/api/v2/" //Local
//var BASEURL:String          =   "https://api.thebayacompany.com/v1" //Live

let CAPITagCountry             =   "country"
let CAPITagSignUp              =   "signup"
let CAPITagLogin               =   "login"
let CAPITagVerifyUser          =   "verifyuser"
let CAPITagResendVerification  =   "resend-verification"
let CAPITagForgotPassword      =   "forgot-password"
let CAPITagResetPassword       =   "reset-password"
let CAPITagEditProfile         =   "editprofile"
let CAPITagNotifyStatus        =   "notifystatus"
let CAPITagChangePassword      =   "changepassword"
let CAPITagCMS                 =   "cms"
let CAPITagProjectList         =   "projectlist"
let CAPITagProjectSubscribe    =   "project-subscribe"
let CAPITagSubscribedProject   =   "subscribed-project"
let CAPITagProjectDetails      =   "project-details"
let CAPITagFavorite            =   "favorite"
let CAPITagTimeline            =   "timelinelist"
let CAPITagScheduleVisit       =   "schedule-visit"
let CAPITagVisitList           =   "visitlist"
let CAPITagRateVisit           =   "rate-visit"
let CAPITagSupport             =   "support"
let CAPITagBrochure            =   "brochure"
let CAPITagAmenities           =   "amenities"
let CAPITagLocationAdvantages  =   "location-advantages"
let CAPITagDeviceToken         =   "device-token"
let CAPITagNotificationList    =   "notificationlist"
let CAPITagBadgeCount          =   "badge-count"
let CAPITagPushNotifyCount     =   "push-notify-count"
let CAPITagPostViewCount       =   "post-view-count"
let CAPITagUserprofile         =   "userprofile"

let CAPITagDocuments             =   "documents"
let CAPITagDocumentRequest       =   "document-request"
let CAPITagPostDocumentRequest   =   "post-document-request"
let CAPITagViewDocumentRequest   =   "view-document-request"
let CAPITagPostMaintenance       =   "post-maintenance"
let CAPITagMaintenance           =   "maintenance"
let CAPITagMaintenanceRequest    =   "maintenance-request"
let CAPITagViewMaintenanceRequest  =   "view-maintenance-request"
let CAPITagRateMaintenanceRequest  =   "rate-maintenance-request"
let CAPITagSkipRating              =  "skip-rating"
let CAPITagReferralFriend          =  "referral-friend"
let CAPITagReferralPoint           =  "referral-point"
let CAPITagCheckPassword           =  "check-password"
let CAPITagMilestone               =  "milestone"
let CAPITagMilestoneDetail         =  "milestone/detail"
let CAPITagHistoryTransaction      = "history-transaction"
let CAPITagCheckPasswordStatus     = "check-password-status"
let CAPITagPayment                 = "payment"
let CAPITagSaveUTR                 = "payment/utr/save"

let CJsonResponse           = "response"
let CJsonMessage            = "message"
let CJsonStatus             = "status"
let CStatusCode             = "status_code"
let CJsonTitle              = "title"
let CJsonData               = "data"
let CJsonMeta               = "meta"

let CLimit                  = 20

let CStatusZero             = 0
let CStatusOne              = 1
let CStatusTwo              = 2
let CStatusThree            = 3
let CStatusFour             = 4
let CStatusFive             = 5
let CStatusEight            = 8
let CStatusNine             = 9
let CStatusTen              = 10
let CStatusEleven           = 11

let CStatus200              = 200 // Success
let CStatus400              = 400 
let CStatus401              = 401 // Unauthorized
let CStatus405              = 405 // User Deleted
let CStatus500              = 500
let CStatus550              = 550 // Inactive/Delete user
let CStatus555              = 555 // Invalid request
let CStatus556              = 556 // Invalid request
let CStatus1009             = -1009 // No Internet
let CStatus1005             = -1005 //Network connection lost

//MARK:- ---------Networking
typealias ClosureSuccess = (_ task:URLSessionTask, _ response:AnyObject?) -> Void
typealias ClosureError   = (_ task:URLSessionTask, _ message:String?, _ error:NSError?) -> Void

class Networking: NSObject
{
    var BASEURL:String?
    
    var headers:[String: String] {
        return ["Authorization" : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImZkNDUzN2U0MTlmODY1ZDA2NmU3ZGMyZDVkOGM4NjIxYjQ0Yzk0ZGI3N2NjMGY2MjUyMTg5YWJmZTliYjVlYzhhZmZkZjM0MmVjYWVlNTRmIn0.eyJhdWQiOiIzIiwianRpIjoiZmQ0NTM3ZTQxOWY4NjVkMDY2ZTdkYzJkNWQ4Yzg2MjFiNDRjOTRkYjc3Y2MwZjYyNTIxODlhYmZlOWJiNWVjOGFmZmRmMzQyZWNhZWU1NGYiLCJpYXQiOjE1NDU4MDk3MDMsIm5iZiI6MTU0NTgwOTcwMywiZXhwIjoxNTc3MzQ1NzAzLCJzdWIiOiIyNCIsInNjb3BlcyI6W119.U_wNCUL3wkfDIeK7md4dxm_6sRUocJ8aJwEics5uaVa26y4pqnSIvo4ZQpE3hLlCqN3qhqpSfjSR-N1OSdwfFRUsTe8lFGjZNuq18uLtymZ6xiVUubbSnH_zYLPxi5DXtfz-T_JnR6XBHbjArJGpmmN6YIan9myULOcpoCEC8WlOatXyHe9owsFwqxLBoLZxcf-LK86K-KZrsoRqMQ4uk1eH4N9DY4Z-fU_5wA986jRuLlj1fIYbv0JfJKvPOpu5jB8YNZ2d_4UgilECgvmUelaSH44Ad1XviDr6kW7cOg-QqON26rW-A8LVniR19CvskZfr8BSHNDrDOI2WUoNIJhP1rTBCbIsFf1DwvosKBGIqgVU9ykUT0vMUbzDONhGMitKhwP4uoFT6HTvua7KzAf8bSS53T_xrgNORp4BA2lJXLR5qvVb56yIvO_0f0CKADmoBgv7GHVAVEXFA0HdEkPKiKe7tyRQDjgZDoBbfwRQ90ohVn3tCXhTkUnHU0eTF9kaKz_KBRq7u22Yq7nnjxg6M3Tu1WukDxlrn6wzWRmu0bCj-hLEAvfkncjhP_OT3Mic7yYDsrXEr8q8ti8PLzqrtVa_Y3xx1ozgT3q5rFgTBmmYn_0Ir4k9oqKg8mzf16V9i87jcMOk0f04ogPqPOCPUYz-_VP3zQU-nr6wMeKw","Accept-Language" : "en","Accept" : "application/json"]
    }

    
    var loggingEnabled = true
    var activityCount = 0
    
    
    /// Networking Singleton
    static let sharedInstance = Networking.init()
    override init() {
        super.init()
    }
    
    fileprivate func logging(request req:Request?) -> Void
    {
        if (loggingEnabled && req != nil)
        {
            var body:String = ""
            var length = 0
            
            if (req?.request?.httpBody != nil) {
                body = String.init(data: (req!.request!.httpBody)!, encoding: String.Encoding.utf8)!
                length = req!.request!.httpBody!.count
            }
            
            let printableString = "\(req!.request!.httpMethod!) '\(req!.request!.url!.absoluteString)': \(String(describing: req!.request!.allHTTPHeaderFields)) \(body) [\(length) bytes]"
            
            print("API Request: \(printableString)")
        }
    }
    
    fileprivate func logging(response res:DataResponse<Any>?) -> Void
    {
        if (loggingEnabled && (res != nil))
        {
            if (res?.result.error != nil) {
                print("API Response: (\(String(describing: res?.response?.statusCode))) [\(String(describing: res?.timeline.totalDuration))s] Error:\(String(describing: res?.result.error))")
            } else {
                
                let data = res?.result.value as? [String : AnyObject]
                if res?.response!.statusCode == CStatus400 {
                   // CTopMostViewController.showAlertView((data?.valueForString(key: CJsonMessage)), completion: nil)
                } else if res?.response!.statusCode == CStatus401 || res?.response!.statusCode == CStatus405 {
//                    CTopMostViewController.showAlertView((data?.valueForString(key: CJsonMessage))) { (result) in
//                        if result {
//                            appDelegate.logout(isForDeleteUser: true)
//                        }
//                    }
                }
                
                print("API Response: (\(String(describing: res?.response!.statusCode))) [\(String(describing: res?.timeline.totalDuration))s] Response:\(String(describing: res?.result.value))")
            }
        }
    }
    
    
    
    /// Uploading
    
    func upload(
        _ URLRequest: URLRequestConvertible,
        multipartFormData: (MultipartFormData) -> Void,
        encodingCompletion: ((SessionManager.MultipartFormDataEncodingResult) -> Void)?) -> Void
    {
        
        let formData = MultipartFormData()
        multipartFormData(formData)
        
        
        var URLRequestWithContentType = try? URLRequest.asURLRequest()
        
        URLRequestWithContentType?.setValue(formData.contentType, forHTTPHeaderField: "Content-Type")
        
        let fileManager = FileManager.default
        let tempDirectoryURL = URL(fileURLWithPath: NSTemporaryDirectory())
        let fileName = UUID().uuidString
        
        #if swift(>=2.3)
            let directoryURL = tempDirectoryURL.appendingPathComponent("com.alamofire.manager/multipart.form.data")
            let fileURL = directoryURL.appendingPathComponent(fileName)
        #else
            
            let directoryURL = tempDirectoryURL.appendingPathComponent("com.alamofire.manager/multipart.form.data")
            let fileURL = directoryURL.appendingPathComponent(fileName)
        #endif
        
        
        do {
            try fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true, attributes: nil)
            try formData.writeEncodedData(to: fileURL)
            
            DispatchQueue.main.async {
                
                let encodingResult = SessionManager.MultipartFormDataEncodingResult.success(request: SessionManager.default.upload(fileURL, with: URLRequestWithContentType!), streamingFromDisk: true, streamFileURL: fileURL)
                encodingCompletion?(encodingResult)
            }
        } catch {
            DispatchQueue.main.async {
                encodingCompletion?(.failure(error as NSError))
            }
        }
    }
    
    // HTTPs Methods
    func GET(param parameters:[String: AnyObject]?, success:ClosureSuccess?,  failure:ClosureError?) -> URLSessionTask?
    {
        
        let uRequest = SessionManager.default.request(BASEURL!, method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        self.logging(request: uRequest)
        
        uRequest.responseJSON { (response) in
            
            self.logging(response: response)
            if(response.result.error == nil && response.response?.statusCode == 200)
            {
                if(success != nil) {
                    success!(uRequest.task!, response.result.value as AnyObject)
                }
            }
            else
            {
                if(failure != nil) {
                    failure!(uRequest.task!, nil , response.result.error as NSError?)
                }
            }
        }
        
        return uRequest.task
    }
    
    func GET(apiTag tag:String, param parameters:[String: AnyObject]?, successBlock success:ClosureSuccess?,   failureBlock failure:ClosureError?) -> URLSessionTask?
    {
        
        let uRequest = SessionManager.default.request((BASEURL! + tag), method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers)
        self.logging(request: uRequest)
        
        uRequest.responseJSON { (response) in
            
            self.logging(response: response)
            if(response.result.error == nil && response.response?.statusCode == 200)
            {
                if(success != nil) {
                    success!(uRequest.task!, response.result.value as AnyObject)
                }
            }
            else
            {
                if(failure != nil) {
                    failure!(uRequest.task!,nil, response.result.error as NSError?)
                }
            }
        }
        
        return uRequest.task
    }
    
    func POST(apiTag tag:String, param parameters:[String: AnyObject]?, successBlock success:ClosureSuccess?,   failureBlock failure:ClosureError?) -> URLSessionTask?
    {
        let uRequest = SessionManager.default.request((BASEURL! + tag), method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        self.logging(request: uRequest)
        
        uRequest.responseJSON { (response) in
            
            self.logging(response: response)
            if(response.result.error == nil && ([200, 201, 401] .contains(response.response!.statusCode)) )
            {
                if(success != nil) {
                    success!(uRequest.task!, response.result.value as AnyObject)
                }
                
            }
//            else if ([405, 403] .contains(response.response!.statusCode)) {
//
//                appDelegate.logout(isForDeleteUser: false)
//
//            }
            else {
                if(failure != nil) {
                    
                    if response.result.error != nil
                    {
                        failure!(uRequest.task!,nil, response.result.error as NSError?)
                    }
                    else
                    {
                        let dict = response.result.value as? [String : AnyObject]
                        
                        guard let message = dict?["message"] else
                        {
                            return failure!(uRequest.task!,nil, nil)
                        }
                        
                        failure!(uRequest.task!, message as? String, nil)
                    }
                    
                }
            }
        }
        
        return uRequest.task
    }
    
    func POST(param parameters:[String: AnyObject]?, tag:String?, multipartFormData: @escaping (MultipartFormData) -> Void, success:ClosureSuccess?,  failure:ClosureError?) -> Void
    {
        SessionManager.default.upload(multipartFormData: { (multipart) in
            multipartFormData(multipart)
            
            if parameters != nil
            {
                for (key, value) in parameters!
                {
                    multipart.append("\(value)".data(using: .utf8)!, withName: key)
                    //  multipart.append(value.data(using: String.Encoding.utf8.rawValue)! , withName: key)
                }
            }
            
        },  to: (BASEURL! + (tag ?? "")), method: HTTPMethod.post , headers: headers) { (encodingResult) in
            
            
            switch encodingResult {
                
            case .success(let uRequest, _, _):
                
                self.logging(request: uRequest)
                
                uRequest.responseJSON { (response) in
                    
                    self.logging(response: response)
                    if(response.result.error == nil)
                    {
                        if(success != nil) {
                            success!(uRequest.task!, response.result.value as AnyObject)
                        }
                    }
                    else
                    {
                        if(failure != nil) {
                            failure!(uRequest.task!,nil, response.result.error as NSError?)
                        }
                    }
                }
                
                break
            case .failure(let encodingError):
                print(encodingError)
                break
            }
        }
        
    }
    
    func HEAD(param parameters: [String: AnyObject]?, success : ClosureSuccess?, failure:ClosureError?) -> URLSessionTask
    {
        
        let uRequest = SessionManager.default.request(BASEURL!, method: .head, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        self.logging(request: uRequest)
        
        uRequest.responseJSON { (response) in
            
            self.logging(response: response)
            if response.result.error == nil
            {
                if (success != nil) {
                    success!(uRequest.task!, response.result.value as AnyObject)
                }
            }
            else
            {
                if(failure != nil) {
                    failure!(uRequest.task!,nil, response.result.error as NSError?)
                }
            }
        }
        
        return uRequest.task!
    }
    
    func PATCH(param parameters: [String: AnyObject]?, success : ClosureSuccess?, failure:ClosureError?) -> URLSessionTask
    {
        
        let uRequest = SessionManager.default.request(BASEURL!, method: .patch, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        self.logging(request: uRequest)
        
        uRequest.responseJSON { (response) in
            
            self.logging(response: response)
            if response.result.error == nil
            {
                if (success != nil) {
                    success!(uRequest.task!, response.result.value as AnyObject)
                }
            }
            else
            {
                if(failure != nil) {
                    failure!(uRequest.task!, nil, response.result.error as NSError?)
                }
            }
        }
        
        return uRequest.task!
    }
    
    func PUT(apiTag tag:String, param parameters:[String: AnyObject]?, successBlock success:ClosureSuccess?,   failureBlock failure:ClosureError?) -> URLSessionTask?
    {
        
        let uRequest = SessionManager.default.request(BASEURL!+tag, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        
        self.logging(request: uRequest)
        
        uRequest.responseJSON { (response) in
            
            self.logging(response: response)
            if(response.result.error == nil && ([200,201] .contains(response.response!.statusCode)) )
            {
                if(success != nil) {
                    success!(uRequest.task!, response.result.value as AnyObject)
                }
            }
            else
            {
                if(failure != nil) {
                    
                    if response.result.error != nil
                    {
                        failure!(uRequest.task!,nil, response.result.error as NSError?)
                    }
                    else
                    {
                        let dict = response.result.value as? [String : AnyObject]
                        
                        guard let message = dict?["message"] else
                        {
                            return failure!(uRequest.task!,nil, nil)
                        }
                        
                        failure!(uRequest.task!,message as? String, nil)
                    }
                    
                }
            }
        }
        
        
        return uRequest.task!
    }
    
    func PUT(param parameters: [String: AnyObject]?, success : ClosureSuccess?, failure:ClosureError?) -> URLSessionTask
    {
        
        let uRequest = SessionManager.default.request(BASEURL!, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        
        self.logging(request: uRequest)
        
        uRequest.responseJSON { (response) in
            
            self.logging(response: response)
            if response.result.error == nil
            {
                if (success != nil) {
                    success!(uRequest.task!, response.result.value as AnyObject)
                }
            }
            else
            {
                if(failure != nil) {
                    failure!(uRequest.task!, nil, response.result.error as NSError?)
                }
            }
            
        }
        
        return uRequest.task!
    }
    
    func DELETE(param parameters: [String: AnyObject]?, success : ClosureSuccess?, failure:ClosureError?) -> URLSessionTask
    {
        
        let uRequest = SessionManager.default.request(BASEURL!, method: .delete, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        self.logging(request: uRequest)
        
        uRequest.responseJSON { (response) in
            
            self.logging(response: response)
            if response.result.error == nil
            {
                if (success != nil) {
                    success!(uRequest.task!, response.result.value as AnyObject)
                }
            }
            else
            {
                if(failure != nil) {
                    failure!(uRequest.task!, nil, response.result.error as NSError?)
                    
                }
            }
        }
        
        return uRequest.task!
    }
}



//MARK:- ---------General
class APIRequest: NSObject {
    
    typealias ClosureCompletion = (_ response:AnyObject?, _ error:NSError?) -> Void
    typealias successCallBack = (([String:AnyObject]?) -> ())
    typealias failureCallBack = ((String) -> ())
    
    private var isInvalidUserAlertDisplaying = false
    
    private override init() {
        super.init()
    }
    
    private static var apiRequest:APIRequest {
        let apiRequest = APIRequest()
        
        if (BASEURL.count > 0 && !BASEURL.hasSuffix("/")) {
            BASEURL = BASEURL + "/"
        }
        
        Networking.sharedInstance.BASEURL = BASEURL
        return apiRequest
    }
    
    static func shared() -> APIRequest {
        return apiRequest
    }
}

//MARK:- ---------API Functions

extension APIRequest {
    
    func loadProjectList(completion : @escaping ClosureCompletion) {
        
        _ = Networking.sharedInstance.POST(apiTag: "projectlist", param: [:], successBlock: { (task, response) in
            
            if response != nil {
                completion(response, nil)
            }
        }, failureBlock: { (task, message, error) in
            completion(nil, error)
        })
        
    }
}




