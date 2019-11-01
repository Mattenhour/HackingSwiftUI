//
//  ContentView.swift
//  Milestone_Project_1-3
//
//  Created by Matt Ridenhour on 10/31/19.
//  Copyright © 2019 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var moves: [String] = ["Rock", "Paper", "Scissors"]
    @State private var appChoice: Int = 0
    @State private var playerScore: Int = 0
    @State private var shouldWin: Bool = false
    
    
    var body: some View {
        VStack {
            Section {
                Text("Players score: \(playerScore)")
                Text("Apps move: \(moves[appChoice])")
                Text("Player should \(shouldWin ? "Win" : "Lose")")
            }
            Section {
                HStack {
                    ForEach(0 ..< moves.count) { number in
                        Button(action: {
                            self.ButtonAction(self.moves[number])
                        }) {
                            Text("\(self.moves[number])")
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                                .shadow(color: .black, radius: 2)
                        }
                    }
                }
            }
        }
    }
    
    func ButtonAction(_ playersMove: String) {
        print("\(playersMove)")
        playerScore += 1
        //TODO: Add case statements logic for what to do
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
