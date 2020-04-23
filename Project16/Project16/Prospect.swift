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
    
    // fileprivate(set) will allow isContacted to be read from anywhere, but can
    // can only changed from with Prospect.swift
    fileprivate(set) var isContacted = false
}

class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        self.people = []
    }
    
    func toggle(_ prospect: Prospect) {
        // Call objectWillChange.send() first before changing your property
        // to ensure SwiftUI gets its animations correct
        objectWillChange.send()
        prospect.isContacted.toggle()
    }
}
