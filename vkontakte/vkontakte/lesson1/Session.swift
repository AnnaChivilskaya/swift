//
//  Session.swift
//  vkontakte
//
//  Created by Аня on 31.01.2022.
//

import Foundation

class Session {
    
    private init() {}
    
    static let user = Session()
    
    var token: String = ""
    var userId: Int = 0
}
