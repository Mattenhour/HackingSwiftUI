//
//  ContentView.swift
//  Milestone_Project_10-12
//
//  Created by Matt Ridenhour on 2/14/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var friendFace = FriendFace()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(friendFace.items) { person in
                    Text(person.name)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
