//
//  ObserObjectChanges.swift
//  Project16
//
//  Created by Matt Ridenhour on 4/14/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

class DelayedUpdater: ObservableObject {
    @Published var value = 0
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct ObserObjectChanges: View {
    @ObservedObject var updater = DelayedUpdater()
    
    var body: some View {
        Text("Value is \(updater.value)")
    }
}

struct ObserObjectChanges_Previews: PreviewProvider {
    static var previews: some View {
        ObserObjectChanges()
    }
}
