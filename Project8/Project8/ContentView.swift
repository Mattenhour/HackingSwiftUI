//
//  ContentView.swift
//  Project8
//
//  Created by Matt Ridenhour on 11/23/19.
//  Copyright © 2019 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
//    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @ObservedObject var sharedObj = SharedObjects()
    @State var showDate = true
    @State var navButtonText: String = ""
    
    var body: some View {
        NavigationView {
            List(sharedObj.missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.sharedObj.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)

                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(self.showDate ? self.showLanchDate(mission) : self.showCrew(mission))
                    }
                }
            }
            .navigationBarTitle("Moonshot")
//            .navigationBarItems(trailing: Button(action: {
//                // Actions
//                self.showDate.toggle()
//            }, label: { Text(self.showDate ? "Crew" : "Launch Date") })
//            )
            .navigationBarItems(trailing:
                Toggle(isOn: $showDate, label: { Text("Show Launch Date") }))
        }
    }
    
    func showLanchDate(_ mission: Mission) -> String {
        return mission.formattedLaunchDate
    }
    
    func showCrew(_ mission: Mission) -> String {
        var temp: String = ""
        let crewCount = mission.crew.count
        
        for (index, member) in mission.crew.enumerated() {
            if index != crewCount - 1 {
                temp += member.name + ", "
            } else {
                temp += member.name
            }
        }
        return temp
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
