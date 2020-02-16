//
//  User.swift
//  Milestone_Project_10-12
//
//  Created by Matt Ridenhour on 2/14/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import Foundation
struct User: Codable, Identifiable {
    
    struct Friend: Codable, Identifiable {
        let id: String
        let name: String
    }
    
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
//    var id: String
//    var isActive: Bool
//    var name: String
//    var age: Int
//    var company: String
//    var email: String
//    var address: String
//    var about: String
//    var registered: Date
//    var tags: [String]
//    var friends: [Friend]
}

