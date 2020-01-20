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
                    NavigationLink(destination: ActivityDetail(activities: self.activities, activity: activity)) {
                        HStack {
                            Text(activity.title)
                            Spacer()
                            Text("Times: \(activity.count)")
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("Activity Tracker")

            .navigationBarItems(leading: EditButton(), trailing:
                Button(action: {
                    self.showingAddActivity = true

                }) {
                    Image(systemName: "plus")
                }
            )
            
            .sheet(isPresented: $showingAddActivity) {
                AddActivity(activities: self.activities)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
