//
//  ContentView.swift
//  Project7
//
//  Created by Matt Ridenhour on 11/16/19.
//  Copyright © 2019 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var project7 = ["Day 36", "Day 37", "Day 38"]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(project7, id: \.self) { exercise in
                        NavigationLink(destination: self.LaunchView(exercise)) {
                            Text(exercise)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Master"))
        }
    }
    
    func LaunchView(_ exercise: String) -> AnyView{
        switch exercise {
        case "Day 36":
            return AnyView(Day36Main())
        case "Day 37":
            return AnyView(Day37Main())
        default:
            return AnyView(Day37Main())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
