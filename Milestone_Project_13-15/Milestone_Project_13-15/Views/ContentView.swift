//
//  ContentView.swift
//  Milestone_Project_13-15
//
//  Created by Matt Ridenhour on 4/5/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Photo.entity(), sortDescriptors: []) var photos: FetchedResults<Photo>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(photos, id: \.self) { photo in
                    NavigationLink(destination: DetailView(photo: photo)) {
                        PhotoCellView(photo: photo)
                    }
                }
            }
            .navigationBarTitle(Text("Name Reminder"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
