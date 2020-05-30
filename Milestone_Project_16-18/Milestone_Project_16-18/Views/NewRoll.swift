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
    
    @State private var sidesOfDice = 6
    @State private var diceRoll = 0
    
    var body: some View {
        VStack {
            Text("\(diceRoll)")
            
            Button(action: {
                self.newDiceRoll()
            }) {
                Text("New Roll")
            }
        }
    }
    
    func newDiceRoll() {
        let randomInt = Int.random(in: 1 ... self.sidesOfDice)
        self.diceRoll = randomInt
        
        self.appendRoll(self.diceRoll)
    }
    
    func appendRoll(_ rollResult: Int) {
        //Create new Roll
        let tempRoll = Roll()
        tempRoll.value = rollResult
        
        rolls.addRoll(tempRoll)
        print(rolls.rolls.count)
    }
}

struct NewRoll_Previews: PreviewProvider {
    static var previews: some View {
        NewRoll().environmentObject(Rolls())
    }
}
