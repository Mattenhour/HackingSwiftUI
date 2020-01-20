//
//  ActivitieItem.swift
//  Milestone_Project_7-6
//
//  Created by Matt Ridenhour on 1/16/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import Foundation
import SwiftUI

struct ActivityItem: Identifiable, Codable {
    let id = UUID()
    let title: String
    let description: String
    var count: Int
}
