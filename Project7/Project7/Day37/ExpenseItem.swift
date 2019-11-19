//
//  ExpenseItem.swift
//  Project7
//
//  Created by Matt Ridenhour on 11/18/19.
//  Copyright © 2019 Matt Ridenhour. All rights reserved.
//

import Foundation
import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}
