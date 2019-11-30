//
//  AstronautView.swift
//  Project8
//
//  Created by Matt Ridenhour on 11/24/19.
//  Copyright © 2019 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    let missionList: [Mission]
    
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)

                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(self.missionList) { mission in
                                VStack(alignment: .center) {
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 180)
                                        .padding(.horizontal)
                                    
                                    Text(mission.displayName)
                                        .font(.headline)
                                }
                            }
                        }
                    }
                    
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut
        
        var matches = [Mission]()
        
        for mission in missions {
            for crew in mission.crew {
                if crew.name == self.astronaut.id {
                    matches.append(mission)
                }
            }
        }
        
        self.missionList = matches
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[14], missions: missions)
    }
}
