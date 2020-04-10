//
//  PhotoCellView.swift
//  Milestone_Project_13-15
//
//  Created by Matt Ridenhour on 4/6/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct PhotoCellView: View {
    var person: Person
    
    var body: some View {
        HStack {
            Text("\(person.wrappedLastName), \(person.wrappedFirstName)")
        }
    }
}

struct PhotoCellView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCellView(person: Person())
    }
}
