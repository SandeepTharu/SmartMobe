//
//  ImagesHandler.swift
//  SmartMobeImages
//
//  Created by Avikishor khadka on 4/21/19.
//  Copyright © 2019 Avikishor khadka. All rights reserved.
//

import Foundation
import ObjectMapper

protocol ImagesDownloading {
    func getImages(completion: @escaping ([Image]?, String) -> Void)
}

protocol ImagesRetrieving {
    func loadImages() -> [Image]?
}

class UsersHandler: ImagesDownloading, ImagesRetrieving {
    
    var apiHandler: APIRequesting!
    
    var realmSaver: ObjectSaving!
    var realmRetriever: ObjectRetrieving!
    var realmPurger: ObjectPurging!
    
    func getImages(completion: @escaping ([Image]?, String) -> Void) {
        let request = APIRequest(url: URL.baseURL + EndPoint.latestImages, method: .get)
        apiHandler.sendRequest(request) { success, data, errorMessage in
            guard success else {
                completion(nil, AlertMessage.requestFailure)
                return
            }
            
            guard let images = Mapper<Image>().mapArray(JSONObject: data) else {
                completion(nil, AlertMessage.requestFailure)
                return
            }
            
            self.purgeImages()
            self.saveImages(images)
            
            completion(images, "")
        }
    }
    
    private func purgeImages() {
        realmPurger.deleteObjects(for: Image.self, cascade: true)
    }
    
    private func saveImages(_ images: [Image]) {
        realmSaver.saveObjects(images)
    }
    
    func loadImages() -> [Image]? {
        return realmRetriever.getObjects(for: Image.self) as? [Image]
    }
}
