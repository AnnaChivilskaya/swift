//
//  Sesion.swift
//  vkontakte
//
//  Created by Аня on 31.01.2022.
//

import Foundation
import SwiftKeychainWrapper

final class Sesion {
    
    private init() {}
    
    static  let shared = Sesion()
    
    var token: String  {
        set {
            KeychainWrapper.standard.set(newValue, forKey: "userId")
        }
        get {
            return KeychainWrapper.standard.string(forKey: "userId") ?? ""
        }
    }
    var userId: Int  {
        set {
            UserDefaults.standard.set(newValue, forKey: "userId")
        }
        get {
            return UserDefaults.standard.integer(forKey: "userId")
        }
    }
}

