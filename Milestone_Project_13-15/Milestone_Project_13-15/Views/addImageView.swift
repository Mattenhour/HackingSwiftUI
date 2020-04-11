//
//  addImageView.swift
//  Milestone_Project_13-15
//
//  Created by Matt Ridenhour on 4/8/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct addImageView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var lastName = ""
    @State private var firstName = ""
    
    let inputImage: UIImage
    let uuid = UUID()
    
    var saveButton: some View {
        Button(action: {
            FileManager.default.saveImage(self.inputImage, to: self.uuid.uuidString) { error in
                if let error = error {
                    print(error)
                } else {
                    
                    let person = Person(context: self.moc)
                    person.id = UUID()
                    person.lastName = self.lastName
                    person.firstName = self.firstName
                    
                    person.photo = Photo(context: self.moc)
                    person.photo?.id = self.uuid
                    
                    try? self.moc.save()
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }) {
            Text("Save")
        }
    }
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.secondary)
                
                //display the image
                Image(uiImage: inputImage)
                    .resizable()
                    .scaledToFit()
            }
            
            Form {
                Section(header: Text("Person info")) {
                    TextField("Last name", text: $lastName)
                    TextField("First name", text: $firstName)
                }
                Section {
                    saveButton
                }
                .disabled(lastName.isEmpty)
                .disabled(firstName.isEmpty)
            }
            
        }
    }
}

struct addImageView_Previews: PreviewProvider {
    static var previews: some View {
        addImageView(inputImage: UIImage())
    }
}
