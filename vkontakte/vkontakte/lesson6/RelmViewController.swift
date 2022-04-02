//
//  RelmViewController.swift
//  vkontakte
//
//  Created by Аня on 06.02.2022.
//
//
import UIKit
 import RealmSwift

//
// class RelmViewController: UIViewController {
//
//     let personDB = PersonDB()
//
//    var persons: [PersonModel] = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let person = Model()
//        person.name = "Deleted 5"
//        person.age = 35
//        person.pet = "Sonik"
//        person.weapon = "M-16"
//
//        personDB.create(person)
//
//        persons = personDB.read()
//        //tableView.reloadData()
//
//        personDB.delete(person)
//
//        persons = personDB.read()
//        //Сохранить
//        let migration = Realm.Configuration(schemaVersion: 5) //миграция работает как на расширение так и на уделение
//        let mainRealm = try! Realm(configuration: migration)
//
//        mainRealm.beginWrite()
//        mainRealm.add(person) //добавляем объект в хранилище
//        try! mainRealm.commitWrite()
//
//        print(mainRealm.configuration.fileURL ?? "")
//
//        //Читать объекты из хранилища
//
//        let persons = mainRealm.objects(PersonModel.self)
//        persons.forEach { print($0.name, $0.age) }
//
//        //Удалить объект из хранилища
//        mainRealm.beginWrite()
//        mainRealm.delete(person)
//        try! mainRealm.commitWrite()
//
//
//     }
// }
//

