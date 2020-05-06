//
//  SpecificAccessibility.swift
//  Project17
//
//  Created by Matt Ridenhour on 5/5/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct SpecificAccessibility: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale: CGFloat = 1
    
    var body: some View {
        Text("Hello World!")
            .scaleEffect(scale)
            .onTapGesture {
                withOptionalAnimation {
                    self.scale *= 1.5
                }
            }
    }
}

struct SpecificAccessibility_Previews: PreviewProvider {
    static var previews: some View {
        SpecificAccessibility()
    }
}
