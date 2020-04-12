//
//  DetailView.swift
//  Milestone_Project_13-15
//
//  Created by Matt Ridenhour on 4/6/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import CoreLocation
import SwiftUI

struct DetailView: View {
    @State private var image: Image?
    @State private var selectedInfo: PersonInfo = PersonInfo.name
    
    var person: Person
    
    var personLocation: CLLocationCoordinate2D {
        .init(latitude: person.latitude, longitude: person.longitude)
    }
    
    func loadImage() {
        let photoUrl = person.wrappedPhoto.wrappedID.uuidString
        
        FileManager.default.loadImage(with: photoUrl) { (image, error) in
            if let error = error {
                print(error)
            } else if let image = image {
                self.image = Image(uiImage: image)
            }
        }
    }
    
    var body: some View {
            VStack(alignment: .leading) {
                ZStack(alignment: .bottomTrailing) {
                    self.image?
                        .resizable()
                        .scaledToFit()
                }
                
                Section(header: Text("Select \(person.wrappedFirstName)'s info")) {
                    Picker("Person info", selection: $selectedInfo) {
                        ForEach(PersonInfo.allCases) {
                            Text($0.name).tag($0)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                
                if selectedInfo == .name {
                    personName(firstName: person.wrappedFirstName, lastName: person.wrappedLastName)
                } else if selectedInfo == .map {
                    personMap(personLocation: personLocation)
                }
                
                Spacer()
            }
        .navigationBarTitle(Text("\(person.wrappedFirstName)'s info"), displayMode: .inline)
        .onAppear(perform: loadImage)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(person: Person())
    }
}
