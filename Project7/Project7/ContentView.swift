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
    @State private var destination = [Day36Main(), Day36Main(), Day36Main()]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(0..<project7.count) { index in
                        NavigationLink(destination: self.destination[index]) {
                            Text("\(self.project7[index])")
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Master"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
