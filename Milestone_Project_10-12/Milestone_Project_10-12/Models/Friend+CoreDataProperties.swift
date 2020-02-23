//
//  Friend+CoreDataProperties.swift
//  Milestone_Project_10-12
//
//  Created by Matt Ridenhour on 2/20/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var origin: User?
    
    var wrappedID: String { id ?? "" }
    var wrappedName: String { name ?? "" }
}
