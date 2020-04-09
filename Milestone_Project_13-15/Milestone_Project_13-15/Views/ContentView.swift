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
    
    @State private var showingImagePicker = false
    @State private var showingPersonForm = false
    
    @State private var inputImage: UIImage?
    
    var addButton: some View {
        Button(action: {
            self.showingImagePicker = true
        }) {
            Image(systemName: "plus")
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: showPersonForm) {
            ImagePicker(image: self.$inputImage)
        }
    }
    
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
            .navigationBarItems(trailing: addButton)
            .sheet(isPresented: $showingPersonForm) {
                // Safe because we guard let?
                addImageView(inputImage: self.inputImage!).environment(\.managedObjectContext, self.moc)
            }
        }
    }
    
    func showPersonForm() {
        guard inputImage != nil else { return }
        
        showingPersonForm = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
