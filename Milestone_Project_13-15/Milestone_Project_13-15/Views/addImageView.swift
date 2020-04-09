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
    
    let inputImage: UIImage
    
    var body: some View {
        Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct addImageView_Previews: PreviewProvider {
    static var previews: some View {
        addImageView(inputImage: UIImage())
    }
}
