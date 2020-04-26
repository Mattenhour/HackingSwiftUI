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
    @Published private(set) var people: [Prospect]

    static let saveKey = "SavedData"
    
    init() {
        self.people = []
        
        let filename = getDocumentsDirectory().appendingPathComponent(Self.saveKey)
        
        do {
            let data = try Data(contentsOf: filename)
            people = try JSONDecoder().decode([Prospect].self, from: data)
        } catch {
             print("Can't load saved data")
        }
    }
    
    
    private func save() {
        let filename = getDocumentsDirectory().appendingPathComponent(Self.saveKey)
        do {
        let data = try JSONEncoder().encode(people)
        try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Can't save data in the documents directory")
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        // Call objectWillChange.send() first before changing your property
        // to ensure SwiftUI gets its animations correct
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
