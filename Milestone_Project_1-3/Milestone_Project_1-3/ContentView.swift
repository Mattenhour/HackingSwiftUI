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
    @State private var moveCount: Int = 0
    @State private var shouldWin: Bool = false
    
    
    var body: some View {
        VStack {
            Section {
                if moveCount >= 10 {
                    Text("Players score: \(playerScore)")
                }
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
        .onAppear(perform: StartGame)
    }
    
    func StartGame() {
        appChoice = Int.random(in: 0..<moves.count)
        shouldWin = Bool.random()
    }
    
    func ButtonAction(_ playersMove: String) {
//        print("\(playersMove)")
        
        let appsMove: String = moves[appChoice]
        
        if appsMove == playersMove {
            playerScore -= 1
            return
        }
        
        shouldWin ? PlayerWin(playersMove) : PlayerLose(playersMove)
        moveCount += 1
        StartGame()
    }
    
    // Logic for if player should win
    func PlayerWin(_ playersMove: String){
        
        let appsMove: String = moves[appChoice]
        
        switch appsMove {
        case "Rock":
            if playersMove == "Paper" {
                playerScore += 1
            } else { playerScore -= 1 }
        case "Paper":
            if playersMove == "Scissors" {
                playerScore += 1
            } else { playerScore -= 1 }
        default:
            if playersMove == "Rock" {
                playerScore += 1
            } else { playerScore -= 1 }
        }
        
    }
    
    // Logic for if player should lose
    func PlayerLose(_ playersMove: String){
        
        let appsMove: String = moves[appChoice]
        
        switch appsMove {
        case "Rock":
            if playersMove == "Scissors" {
                playerScore += 1
            } else { playerScore -= 1 }
        case "Paper":
            if playersMove == "Rock" {
                playerScore += 1
            } else { playerScore -= 1 }
        default:
            if playersMove == "Paper" {
                playerScore += 1
            } else { playerScore -= 1 }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
