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
        GeometryReader { fullScreen in
            ScrollView(.vertical) {
                VStack {
                    GeometryReader { geo in
                        Image(self.mission.image)
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(max(0.8, min(1.0, geo.frame(in: .global).minY / (fullScreen.size.height / 10))))
                            .frame(maxWidth: geo.size.width)
//                            .padding(.top)
//                            .accessibility(hidden: true)
                    }
                    .frame(height: 300)
                    
                    Text(self.mission.formattedLaunchDate)
                        .padding()
                    
                    Text(self.mission.description)
                        .padding()
                    
                    missionCrew(crews: self.astronauts, sharedObj: self.sharedObj)
                    
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

extension MissionView {
    
    struct missionCrew: View {
        var crews: [CrewMember]
        @ObservedObject var sharedObj: SharedObjects
        
        var body: some View {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(self.crews, id: \.role) { member in
                        NavigationLink(destination: AstronautView(astronaut: member.astronaut, missions: self.sharedObj.missions)) {
                            VStack(alignment: .center) {
                                Image(member.astronaut.id)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 185)
                                    .clipShape(Capsule())
                                    .overlay(Capsule().stroke(Color.primary, lineWidth: 1))

                                Text(member.astronaut.name)
                                    .font(.caption)

                                Text(member.role)
                                    .font(.caption)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
    
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[1], astronauts: astronauts)
    }
}
