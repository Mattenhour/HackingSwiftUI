//
//  PhotoCellView.swift
//  Milestone_Project_13-15
//
//  Created by Matt Ridenhour on 4/6/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct PhotoCellView: View {
    var photo: Photo
    
    var body: some View {
        HStack {
            Text("\(photo.wrappedPerson.wrappedLastName), \(photo.wrappedPerson.wrappedFirstName)")
        }
    }
}

struct PhotoCellView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCellView(photo: Photo())
    }
}
