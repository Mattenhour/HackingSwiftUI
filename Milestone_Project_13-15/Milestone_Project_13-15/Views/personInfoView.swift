//
//  personInfoView.swift
//  Milestone_Project_13-15
//
//  Created by Matt Ridenhour on 4/11/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import CoreLocation
import SwiftUI

struct personName: View {
    
    var firstName: String
    var lastName: String
    
    var body: some View {
        Group {
            HStack {
                Text("First Name:")
                    .bold()
                    .padding(.leading, 10)
                
                Text("\(self.firstName)")
                    .fontWeight(.light)
                Spacer()
            }
            .padding(.top)
            .padding(.bottom)
            
            HStack {
                Text("Last Name:")
                .bold()
                .padding(.leading, 10)
                
                Text("\(self.lastName)")
                    .fontWeight(.light)
                Spacer()
            }
        }
    }
}

struct personMap: View {
    
    var personLocation: CLLocationCoordinate2D
    
    var body: some View {
        MapView(location: personLocation)
            .frame(height: 300)
    }
}
