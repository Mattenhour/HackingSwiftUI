//
//  MissionView.swift
//  Project8
//
//  Created by Matt Ridenhour on 11/24/19.
//  Copyright © 2019 Matt Ridenhour. All rights reserved.
// test

import SwiftUI

struct MissionView: View {
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    @ObservedObject var sharedObj = SharedObjects()
    
    let mission: Mission
    let astronauts: [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.70)
                        .padding(.top)
                    
                    Text(self.mission.formattedLaunchDate)
                        .padding()
                    
                    Text(self.mission.description)
                        .padding()
                    
                    Group {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(self.astronauts, id: \.role) { crewMember in
                                    NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut, missions: self.sharedObj.missions)) {
                                        VStack(alignment: .center) {
                                            Image(crewMember.astronaut.id)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 185)
                                                .clipShape(Capsule())
                                                .overlay(Capsule().stroke(Color.primary, lineWidth: 1))

                                            Text(crewMember.astronaut.name)
                                                .font(.caption)

                                            Text(crewMember.role)
                                                .font(.caption)
                                        }
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                    }
                    Spacer(minLength: 25)
                }
            }
        }
        .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
    }
    
    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission
        var matches = [CrewMember]()
        
        for member in mission.crew {
            if let match = astronauts.first(where: { $0.id == member.name }) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }
        self.astronauts = matches
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[1], astronauts: astronauts)
    }
}
