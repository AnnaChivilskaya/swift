//
//  Account.swift
//  vkontakte
//
//  Created by Аня on 31.01.2022.
//

import Foundation

final class Account {
    
    private init() {}
        
    static let shared = Account()
        
    var name: String =  ""
    var cash: Int =  0
    
}
