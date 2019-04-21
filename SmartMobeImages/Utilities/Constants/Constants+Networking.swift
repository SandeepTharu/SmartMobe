//
//  Constants+Networking.swift
//  SmartMobeImages
//
//  Created by Avikishor khadka on 4/21/19.
//  Copyright © 2019 Avikishor khadka. All rights reserved.
//

import Foundation
struct Domain {
    static var typicode: String { return "www.splashbase.com" }
}

struct EndPoint {
    static var latestImages : String { return "api/v1/images/latest" }
    static var searchImage : String { return "api/v1/images/search" }
}

struct URL {
    static var baseURL : String { return "http://www.splashbase.com/" }
}
