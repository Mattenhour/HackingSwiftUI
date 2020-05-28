//
//  ContentView.swift
//  Milestone_Project_16-18
//
//  Created by Matt Ridenhour on 5/26/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var rolls = Rolls()
    
    var body: some View {
        TabView {
            NewRoll()
                .tabItem {
                    Image(systemName: "plus")
                    Text("New Roll")
                }
            AllRolls()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("All Rolls")
                }
        }
        .environmentObject(rolls)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
