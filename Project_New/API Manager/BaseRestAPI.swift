//
//  BaseRestAPI.swift
//  Project_New
//
//  Created by Apple on 01/07/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import Alamofire

class BaseRestAPI: NSObject {
    //network API for requestn
    class func requestGETURL(_ strURL: String,
                             completion:@escaping (Data?, Error?) -> Void) {
        Alamofire.request(strURL, method: .get, parameters: nil,
                          encoding: JSONEncoding.default, headers: nil).responseString { (response) in
                            switch response.result {
                            case .success:
                                let responseData = response.value?.data(using: .utf8)
                                completion(responseData, nil)
                            case .failure((let error)):
                                completion(nil, error)
                            }
        }
    }
}
