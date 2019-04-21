//
//  Image.swift
//  SmartMobeImages
//
//  Created by Avikishor khadka on 4/21/19.
//  Copyright © 2019 Avikishor khadka. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import ObjectMapper_Realm

class Image : Object, Mappable{
    @objc dynamic var id = 0
    @objc dynamic var url = ""
    @objc dynamic var largeUrl = ""
    @objc dynamic var sourceId = 0
    
    override static func primaryKey() -> String?{
        
        return "id"
    }
    
    required convenience init(map : Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        url <- map["url"]
        largeUrl <- map["larrge_url"]
        sourceId <- map["source_id"]
    }
    
}
