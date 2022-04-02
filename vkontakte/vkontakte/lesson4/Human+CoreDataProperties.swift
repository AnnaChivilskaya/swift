//
//  Human+CoreDataProperties.swift
//  vkontakte
//
//  Created by Аня on 03.02.2022.
//
//

import Foundation
import CoreData


extension Human {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Human> {
        return NSFetchRequest<Human>(entityName: "Human")
    }

    @NSManaged public var birthday: Date?
    @NSManaged public var gender: Bool
    @NSManaged public var name: String?

}

extension Human : Identifiable {

}
