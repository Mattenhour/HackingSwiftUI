//
//  Prospect.swift
//  Project16
//
//  Created by Matt Ridenhour on 4/20/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    let id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var isContacted = false
}

class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        self.people = []
    }
}
