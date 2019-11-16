//
//  GameSettings.swift
//  Milestone_Project_4-6
//
//  Created by Matt Ridenhour on 11/16/19.
//  Copyright © 2019 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct GameSettings: View {
    @State var multipyTable = 1
    @State var questions = [5,10,15,20]
    @State var numberOfQuestion = 0
    @State var startGame = false
    
    var body: some View {
        Form {
            Section(header: Text("Multiplication tables size")) {
                Stepper(value: $multipyTable, in: 1...12, step: 1) {
                    Text("\(multipyTable)")
                }
            }
            
            Section(header: Text("Number of questions")) {
                Picker(selection: $numberOfQuestion, label: Text("Select number of questions")) {
                    ForEach(0 ..< questions.count) {
                        Text("\(self.questions[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Button(action: {
                // your action here
            }) {
                Text("Start game")
            }
        }
    }
}

struct GameSettings_Previews: PreviewProvider {
    static var previews: some View {
        GameSettings()
    }
}
