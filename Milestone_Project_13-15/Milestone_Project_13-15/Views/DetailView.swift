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
    @State private var selectedInfo = 0
    var personInfoOptions = ["Full name", "Location met"]
    
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
    
    var personName: some View {
        Group {
            HStack {
                Text("First Name:")
                    .bold()
                    .padding(.leading, 10)
                
                Text("\(self.person.wrappedFirstName)")
                    .fontWeight(.light)
            }
            .padding(.bottom)
            
            HStack {
                Text("Last Name:")
                .bold()
                .padding(.leading, 10)
                
                Text("\(self.person.wrappedLastName)")
                    .fontWeight(.light)
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
                        ForEach(0..<personInfoOptions.count) { index in
                            Text(self.personInfoOptions[index]).tag(index)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                if selectedInfo == 0 {
                    personName
                } else if selectedInfo == 1 {
                    MapView(location: personLocation)
                        .frame(height: 300)
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
