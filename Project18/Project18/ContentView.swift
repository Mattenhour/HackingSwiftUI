//
//  ContentView.swift
//  Project18
//
//  Created by Matt Ridenhour on 5/19/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnterView()
                .background(Color.green)
            Text("Bottom")
        }
    }
}

struct InnterView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { geo in
                Text("Center")
                    .background(Color.blue)
                    .onTapGesture {
                        print("Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)") //Whole screen
                        print("Custom center: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)") // - safearea
                        print("Local center: \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)") // Inside GeoReader
                    }
            }
            .background(Color.orange)
            Text("Right")
        }
    }
}

struct ContentView: View {
    var body: some View {
        OuterView()
            .background(Color.red)
            .coordinateSpace(name: "Custom")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
