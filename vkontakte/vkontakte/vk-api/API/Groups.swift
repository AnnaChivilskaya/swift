//
//  Groups.swift
//  vkontakte
//
//  Created by Аня on 30.03.2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

class GroupsDB: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var name: String
    @objc dynamic var photo50: String
    
    var fullnamegroups: String {
        
        name + photo50
    }

    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "name"
        case photo50 = "photo_50"
    }
}

struct Groups {
    
}

final class Group {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Sesion.shared.token
    let userId =  Sesion.shared.userId
    let version =  "5.81"
    
    func getGroups(completion:  @escaping([GroupsDB])->()) {
        
        let method = "/groups.get"
        
        let parameters: Parameters = [
            "user_id":userId,
            "extended": 1,
            "fields":"city, activity,  verified",
            "count":5,
            "access_token":token,
            "v":version
        ]
        let url = baseUrl + method
        
        AF.request(url, method: .get,  parameters: parameters).responseJSON { response in
            
            guard let data = response.data else  { return }
            
            debugPrint(response.data?.prettyJSON)
                 
            do  {
                
                let groupsJSON = try JSON(data)["response"]["items"].rawData()
                let groups = try JSONDecoder().decode([GroupsDB].self, from: groupsJSON)
                
            } catch  {
                print(error)
            }
            
        }
    }
}
