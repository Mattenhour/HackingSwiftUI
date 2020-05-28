//
//  NewRoll.swift
//  Milestone_Project_16-18
//
//  Created by Matt Ridenhour on 5/27/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct NewRoll: View {
    @EnvironmentObject var rolls: Rolls
    
    var body: some View {
        Text("NewRoll view")
    }
}

struct NewRoll_Previews: PreviewProvider {
    static var previews: some View {
        NewRoll().environmentObject(Rolls())
    }
}
