//
//  ContentView.swift
//  Project5
//
//  Created by Matt Ridenhour on 11/5/19.
//  Copyright © 2019 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            // we found the file
            
            if let fileContents = try? String(contentsOf: fileURL) {
                // we load the file into a string
            }
        }
        
        return Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
