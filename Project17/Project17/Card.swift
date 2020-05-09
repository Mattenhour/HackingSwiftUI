//
//  Card.swift
//  Project17
//
//  Created by Matt Ridenhour on 5/8/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import Foundation

struct Card {
    let prompt: String
    var answer: String
    
    static var example: Card {
        Card(prompt: "Who Played the 13th Doctgor in Doctor Who?",
             answer: "Jodie Whittaker")
    }
}
