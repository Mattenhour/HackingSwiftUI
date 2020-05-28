//
//  Rolls.swift
//  Milestone_Project_16-18
//
//  Created by Matt Ridenhour on 5/27/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI
class Rolls: ObservableObject {
    @Published private(set) var rolls: [Roll]
    
    init() {
        self.rolls = []
    }
    
    func addRoll(_ roll: Roll) {
        rolls.append(roll)
    }
}
