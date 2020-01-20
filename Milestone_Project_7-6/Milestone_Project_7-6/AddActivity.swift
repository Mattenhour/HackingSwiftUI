//
//  AddActivity.swift
//  Milestone_Project_7-6
//
//  Created by Matt Ridenhour on 1/16/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct AddActivity: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var activities: Activities
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                
                TextField("Description", text: $description)
                
            }
            .navigationBarTitle("Add new activity")
            .navigationBarItems(trailing: Button("Save") {
                let activity = ActivityItem(title: self.title, description: self.description, count: 0)
                self.activities.items.append(activity)
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddActivity_Previews: PreviewProvider {
    static var previews: some View {
        AddActivity(activities: Activities())
    }
}
