//
//  DetailView.swift
//  Milestone_Project_13-15
//
//  Created by Matt Ridenhour on 4/6/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @State private var image: Image?
    
    var person: Person
    
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
