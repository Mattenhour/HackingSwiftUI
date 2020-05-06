//
//  NotifiedWhenInBackground.swift
//  Project17
//
//  Created by Matt Ridenhour on 5/5/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct NotifiedWhenInBackground: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                print("Moving to the background!")
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                print("Moving to the foreground!")
            }
    }
}

struct NotifiedWhenInBackground_Previews: PreviewProvider {
    static var previews: some View {
        NotifiedWhenInBackground()
    }
}
