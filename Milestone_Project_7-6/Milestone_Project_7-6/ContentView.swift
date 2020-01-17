//
//  ContentView.swift
//  Milestone_Project_7-6
//
//  Created by Matt Ridenhour on 1/16/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var activities = Activities()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) { activity in
                    VStack {
                        Text(activity.title)
                    }
                }
            }
            .navigationBarTitle("Activity Tracker")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
