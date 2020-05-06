//
//  TriggeringEvents.swift
//  Project17
//
//  Created by Matt Ridenhour on 5/5/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct TriggeringEvents: View {
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter: Int = 0
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(timer) { time in
                if self.counter == 5 {
                    self.timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                    self.counter += 1
                }
            }
    }
}

struct TriggeringEvents_Previews: PreviewProvider {
    static var previews: some View {
        TriggeringEvents()
    }
}
