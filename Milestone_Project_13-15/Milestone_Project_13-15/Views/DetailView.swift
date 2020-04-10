//
//  DetailView.swift
//  Milestone_Project_13-15
//
//  Created by Matt Ridenhour on 4/6/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var person: Person
    
    var body: some View {
        Text("DetailView")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(person: Person())
    }
}
