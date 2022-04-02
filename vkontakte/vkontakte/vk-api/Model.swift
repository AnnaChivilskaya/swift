//
//  Model.swift
//  vkontakte
//
//  Created by Аня on 30.03.2022.
//

import Foundation

final class Model {
    var token: String = ""
    var userID: Int = 0
    
    static let auth = Model()
    
    private init() { }
}
