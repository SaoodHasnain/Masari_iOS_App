//
//  APIHelper.swift
//  Sculpt
//
//  Created by Bukhari Syed Saood on 11/30/20.
//

import UIKit
import Alamofire

class APIHelper: NSObject {
    
    static let sharedIntance = APIHelper()


    func sendPostRequest(url: String, parameters: Parameters?, headers: HTTPHeaders?, completion: @escaping (AFDataResponse<String>) -> Void) -> Void {
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseString { (response) in
                completion(response)
        }
    }
    
    //MARK:- Get Method

    func sendGetRequest(url: String, headers: HTTPHeaders? ,params: Parameters?, completion: @escaping (AFDataResponse<String>) -> Void) -> Void {
        AF.request(url, method: .get ,headers: headers).validate().responseString { response in
            completion(response)
        }
    }
    
    //MARK:- Put Method
    

    func sendPutRequest(url: String, headers: HTTPHeaders? ,params: Parameters?, completion: @escaping (AFDataResponse<String>) -> Void) -> Void {
        AF.request(url, method: .put ,headers: headers).validate().responseString { response in
            completion(response)
        }
    }
    
}
