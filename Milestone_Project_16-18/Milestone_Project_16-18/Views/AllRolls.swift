//
//  AllRolls.swift
//  Milestone_Project_16-18
//
//  Created by Matt Ridenhour on 5/27/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct AllRolls: View {
    @EnvironmentObject var rolls: Rolls
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("sum of rolls: \(rolls.sumRolls())")
            
            List {
                ForEach(rolls.rolls) { currentRoll in
                    Text("\(currentRoll.value)")
                        .font(.body)
                }
            }
        }
    }
}

struct AllRolls_Previews: PreviewProvider {
    static var previews: some View {
        AllRolls().environmentObject(Rolls())
    }
}
