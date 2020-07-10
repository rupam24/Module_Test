//
//  Constants.swift
//  Project_New
//
//  Created by Apple on 01/07/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

struct Constants {
    /**
     URL for API call
     */

    static let jsonUrl = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"

    /**
     This used as identifier in table view and collection view
     */
    static let cellIdentifier = "UserContentCell"

    /**
     For constant marging
     */

    static let constantMarginInCell = 10

    /**
     Constants when there is no data
     */

    static let noTitle = "No Title"
    static let noSubtitle = " "

    /**
     For tag for Activity Indicator
    */
    static var activityIndicatorTag: Int { return 999999 }

    /**
     Constant Messages for errors
     */
    static let networkNotAvailable = "Network not available"
    static let userListEmpty = "User Content List is empty"
    /**
      Static message for refresh control
     */
    static let refreshTitle = "Pull to refersh"
    static let retryTitle = "Retry"
    /** Static constant for errors
     */
    static let fatalError = "Not able to load cell from nib"
    /** Static constant for placeholder
     */
    static let Imageplaceholder = "placeholder4"
}
