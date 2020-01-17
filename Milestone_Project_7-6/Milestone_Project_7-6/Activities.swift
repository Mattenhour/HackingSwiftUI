//
//  Activities.swift
//  Milestone_Project_7-6
//
//  Created by Matt Ridenhour on 1/16/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

class Activities: ObservableObject {
    
    @Published var items: [ActivityItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let item = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ActivityItem].self, from: item) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}
