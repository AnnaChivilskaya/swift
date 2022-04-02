//
//  PhotoAPI.swift
//  vkontakte
//
//  Created by Аня on 01.02.2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

class PhotoDB: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var photo50: String
    @objc dynamic var photo100: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case photo50 = "photo_50"
        case photo100 = "photo_100"
    }
}


struct Photo {
    
}

final class PhotoAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Sesion.shared.token
    let userId =  Sesion.shared.userId
    let version =  "5.81"
    
    func  getPhotos(completion: @escaping([PhotoDB])->()) {
        
        let method = "/photos.getAll"
        
        let parameters: Parameters  = [
            "owner_id":  userId,
            "extended": 1,
            "count": 10,
            "no_service_albums":  0,
            "access_token": token,
            "v": version
        ]
        
        let url = baseUrl + method
        
        AF.request(url,method: .get, parameters: parameters).responseJSON(completionHandler: { response  in
            
        print(response.value)
            
            guard let data = response.data else  { return }
            
            debugPrint(response.data?.prettyJSON ?? "")
                 
            do  {
                
                let photoJSON = try JSON(data)["response"]["items"].rawData()
                let photos = try JSONDecoder().decode([PhotoDB].self, from: photoJSON)
                
            } catch  {
                print(error)
            }
    })
        }
}
