//
//  Person+CoreDataProperties.swift
//  Milestone_Project_13-15
//
//  Created by Matt Ridenhour on 4/5/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }
    
    @NSManaged public var id: UUID?
    @NSManaged public var lastName: String?
    @NSManaged public var firstName: String?
    @NSManaged public var origin: Photo?
    
    var wrappedID: UUID { id ?? UUID() }
    var wrappedLastName: String { lastName ?? "Unknown last name" }
    var wrappedFirstName: String { firstName ?? "Unknown first name" }

}
