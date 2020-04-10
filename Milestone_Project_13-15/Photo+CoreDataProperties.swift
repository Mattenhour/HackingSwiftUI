//
//  Photo+CoreDataProperties.swift
//  Milestone_Project_13-15
//
//  Created by Matt Ridenhour on 4/10/20.
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
    @NSManaged public var person: Person?
    
    var wrappedID: UUID { id ?? UUID() }
    var wrappedPerson: Person { person ?? Person() }
}
