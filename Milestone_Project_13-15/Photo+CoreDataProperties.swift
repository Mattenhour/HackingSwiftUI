//
//  Photo+CoreDataProperties.swift
//  Milestone_Project_13-15
//
//  Created by Matt Ridenhour on 4/5/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var photoPerson: Person?
    
    var wrappedID: UUID { id ?? UUID() }
    
    var wrappedPerson: Person { photoPerson ?? Person() }
}

// MARK: Generated accessors for photoPerson
extension Person {
    @objc(addFriendsObject:)
    @NSManaged public func addToPhotoPerson(_ value: Person)
}
