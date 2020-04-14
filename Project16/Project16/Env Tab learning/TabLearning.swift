//
//  TabLearning.swift
//  Project16
//
//  Created by Matt Ridenhour on 4/13/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct TabLearning: View {
    @State private var selectedTab = ""
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Tab 1")
            .onTapGesture {
                self.selectedTab = "one"
            }
            .tabItem {
                Image(systemName: "star")
                Text("One")
            }
            .tag("zero")

            Text("Tab 2")
            .tabItem {
                Image(systemName: "star.fill")
                Text("Two")
            }
            .tag("one")
        }
    }
}

struct TabLearning_Previews: PreviewProvider {
    static var previews: some View {
        TabLearning()
    }
}
