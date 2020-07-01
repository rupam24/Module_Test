//
//  UserContentAPI.swift
//  Project_New
//
//  Created by Apple on 01/07/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

protocol ContentAPI {
    func fetchContent(completion:@escaping (UserContentWrapper?, Error?) -> Void )
}

class UserContentAPI: ContentAPI {

    func fetchContent(completion: @escaping (UserContentWrapper?, Error?) -> Void) {
        BaseRestAPI.requestGETURL(Constants.jsonUrl) { (data, error) in
            guard let data = data else {
                completion(nil, error)
                return
            }
            do {
                let userWrapper = try JSONDecoder().decode(UserContentWrapper.self, from: data)
                completion(userWrapper, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}
