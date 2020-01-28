//
//  Helper.swift
//  Project10
//
//  Created by Matt Ridenhour on 1/27/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import Foundation
extension String {
    
    /// A Boolean value indicating whether a string has only whitespaces.
    var isBlank: Bool {
        return allSatisfy({ $0.isWhitespace })
    }
}
