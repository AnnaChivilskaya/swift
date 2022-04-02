//
//  FriendsAPI.swift
//  vkontakte
//
//  Created by Аня on 31.01.2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift


class FriendsDB: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var photo50: String
    @objc dynamic var photo100: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case photo50 = "photo_50"
        case photo100 = "photo_100"
    }
}

struct Friends {
    
}

final class  FriendsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Sesion.shared.token
    let userId = Sesion.shared.userId
    let version = "5.68"
    
    
    func getFriends(completion: @escaping([FriendsDB])->()) {
        
        let method = "/friends.get"
        
        let parameters: Parameters = [
            "user_id": userId,
            "order": "name",
            "fields": "photo_50, photo_100",
            "count": 10,
            "access_token": token,
            "v": version
        ]
    
        let url = baseUrl + method
        
        AF.request(url, method: .get,  parameters: parameters).responseJSON { response in
            
            guard let data = response.data else  { return }
            
            debugPrint(response.data?.prettyJSON)
                 
            do  {
                
                let friendJSON = try JSON(data)["response"]["items"].rawData()
                let friends = try JSONDecoder().decode([FriendsDB].self, from: friendJSON)
                
            } catch  {
                print(error)
            }
            
        }
    }
}
