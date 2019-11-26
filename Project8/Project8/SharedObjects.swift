//
//  SharedObjects.swift
//  Project8
//
//  Created by Matt Ridenhour on 11/25/19.
//  Copyright © 2019 Matt Ridenhour. All rights reserved.
//

import SwiftUI

class SharedObjects: ObservableObject {
    @Published var astronauts: [Astronaut]
    @Published var missions: [Mission]
    
    init() {
        self.astronauts = Bundle.main.decode("astronauts.json")
        self.missions = Bundle.main.decode("missions.json")
    }
}
