//
//  ContentView.swift
//  Project2
//
//  Created by Matt Ridenhour on 10/26/19.
//  Copyright © 2019 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State var score = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                    .accessibilityElement(children: .combine)
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        flagImage(countryFlag: self.countries[number])
                    }
                }
                Text("Current score: \(score)")
                Spacer()
            }
        }
       .alert(isPresented: $showingScore) {
           Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
               self.askQuestion()
           })
       }
    }
    
    func flagTapped (_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            
        } else {
            scoreTitle = "Wrong! That was the flag of \(countries[number])"
            score -= 1
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

extension ContentView {
    
    struct flagImage: View {
        var countryFlag: String
        
        let labels = [
            "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
            "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
            "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
            "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
            "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
            "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
            "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
            "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
            "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
            "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
            "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
        ]
        
        var body: some View {
            Image(self.countryFlag)
                .renderingMode(.original)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                .shadow(color: .black, radius: 2)
                .accessibility(label: Text(labels[countryFlag, default: "Unknown flag"]))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
