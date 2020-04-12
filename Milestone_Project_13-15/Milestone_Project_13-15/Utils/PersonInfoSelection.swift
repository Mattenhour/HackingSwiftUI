//
//  InfoSelection.swift
//  Milestone_Project_13-15
//
//  Created by Matt Ridenhour on 4/11/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

enum PersonInfo: Int, CaseIterable, Identifiable, Hashable {
    case name
    case map
}

extension PersonInfo {
    var id: UUID { return UUID() }
    
    var name: String {
        switch(self) {
        case .name:
            return "Full name"
        case .map:
            return "Location met"
        }
    }
}
