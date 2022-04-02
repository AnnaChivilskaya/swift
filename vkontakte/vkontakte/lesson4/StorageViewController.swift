//
//  StorageViewController.swift
//  vkontakte
//
//  Created by Аня on 03.02.2022.
//

import UIKit
import SwiftKeychainWrapper
import CoreData
import RealmSwift

class User: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var userId: String = ""
    @objc dynamic var token: String = ""
    
}

class StorageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    //useUserDegaults()
    //useKeychain()
        //useCoreData()
        useRealm()
    }
    
    func useUserDegaults() {
        
        let stepFrom = UserDefaults.standard.integer(forKey: "stepForm")
        let isOnboarded = UserDefaults.standard.bool(forKey: "isOnboarded")
        print(stepFrom, isOnboarded)
        
        UserDefaults.standard.set(3,forKey: "stepForm")
        UserDefaults.standard.set(true,forKey: "isOnboarded")
    }
    
    func useKeychain() {
        
        let token: String? = KeychainWrapper.standard.string(forKey: "token")
        
        print(token ?? "")
        
        KeychainWrapper.standard.set("qwerty123456", forKey: "token")
        
    }

    func useCoreData() {
        
        let  appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newHuman = Human(context: context)
        newHuman.name = "Jack"
        newHuman.gender = true
        newHuman.birthday = Date()
        
        appDelegate.saveContext()
        
        let results = try! context.fetch(Human.fetchRequest()) as! [Human]
        let human = results.first!
        
        print(human)
        
    }
    
    func useRealm() {
        
        let user = User()
        user.name = "Kolobok"
        user.token = "qwerty123456"
        user.userId = "12345678"
        
        let migration = Realm.Configuration(schemaVersion: 2)
        let realm = try! Realm(configuration: migration)
        
        realm.beginWrite()
        realm.add(user)
        try! realm.commitWrite()
        
        let users = realm.objects(User.self)
        users.forEach { print($0.name, $0.token, $0.userId)}
        
    }
}
