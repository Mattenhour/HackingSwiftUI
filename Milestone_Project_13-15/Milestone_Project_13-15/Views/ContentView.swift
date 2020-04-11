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
    @FetchRequest(entity: Person.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Person.firstName, ascending: true),
        NSSortDescriptor(keyPath: \Person.lastName, ascending: true)
    ]) var people: FetchedResults<Person>
    
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
                ForEach(people, id: \.self) { person in
                    NavigationLink(destination: DetailView(person: person)) {
                        PhotoCellView(person: person)
                    }
                }
                .onDelete(perform: deletePerson)
            }
            .navigationBarTitle(Text("Name Reminder"))
            .navigationBarItems(leading: EditButton(), trailing: addButton)
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
    
    func deletePerson(at offsets: IndexSet){
        for offset in offsets {
            // find this book in our fetch request
            let person = people[offset]
            let photo = person.wrappedPhoto
            
            moc.delete(person)
            moc.delete(photo)
            FileManager.default.deleteImage(at: photo.wrappedID.uuidString)
        }
        
        try? moc.save()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
