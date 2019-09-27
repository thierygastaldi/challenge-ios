//
//  RestApiManager.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

typealias ServiceResponse = (JSON, Error?) -> Void

class RestApiManager: NSObject {
    
    static let sharedInstance = RestApiManager()
    static let url = "https://alodjinha.herokuapp.com/"
    
    func makeHTTPGetRequest(_ endPointUrl: String, onCompletion: @escaping ServiceResponse) {
        let path = RestApiManager.url + endPointUrl
        
        Alamofire.request(path, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                guard response.result.error == nil else {
                    onCompletion(JSON.null, response.result.error!)
                    return
                }
                
                guard response.result.value != nil else {
                    onCompletion(JSON.null, response.result.error!)
                    return
                }
                
                let json:JSON = JSON(response.result.value!)
                onCompletion(json, nil)
        }
    }
    
    func makeHTTPPostRequest(endPointUrl: String, body: JSON, onCompletion: @escaping ServiceResponse) {
        let path = RestApiManager.url + endPointUrl
        
        Alamofire.request(path, method: .post, parameters: body.dictionaryObject, encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                guard response.result.error == nil else {
                    onCompletion(JSON.null, response.result.error!)
                    return
                }
                
                guard response.result.value != nil else {
                    onCompletion(JSON.null, response.result.error!)
                    return
                }
                
                let json:JSON = JSON(response.result.value!)
                onCompletion(json, nil)
        }
        
    }
}
