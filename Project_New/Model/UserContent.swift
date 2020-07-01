//
//  UserContent.swift
//  Project_New
//
//  Created by Apple on 01/07/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

struct UserContent: Codable {

    let title: String?
    let description: String?
    let imageHref: String?

    enum CodingKeys: String, CodingKey {
        case title
        case description
        case imageHref
    }

}

struct UserContentWrapper: Codable {
    let title: String?
    let rows: [UserContent]?

    enum CodingKeys: String, CodingKey {
        case title
        case rows
    }

}
