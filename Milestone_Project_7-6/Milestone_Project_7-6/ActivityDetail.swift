//
//  ActivityDetail.swift
//  Milestone_Project_7-6
//
//  Created by Matt Ridenhour on 1/19/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct ActivityDetail: View {
    @ObservedObject var activities: Activities
    @State var activity: ActivityItem
    
    var body: some View {
        
        Form {
            
            Section(header: Text("Habit name")) {
                Text(activity.title)
            }
            
            Section(header: Text("Habit name")) {
                Text(activity.description)
            }
            
            Section(header: Text("Complete times")) {
                
               HStack {
                   Text("\(activity.count)")
                   Spacer()
                   Button("+1") {
                       self.activity.count += 1
                       if let firstIndex = self.activities.items.firstIndex(where: { (item) -> Bool in
                           item.id == self.activity.id
                       }) {
                           self.activities.items[firstIndex] = self.activity
                       }
                   }.padding(.trailing)
               }
            }
        }
    }
    
}

struct ActivityDetail_Previews: PreviewProvider {
    static let activities = Activities()
    static let activity = ActivityItem(title: "Test", description: "This is a test", count: 0)
    
    static var previews: some View {
        ActivityDetail(activities: activities, activity: activity)
    }
}
