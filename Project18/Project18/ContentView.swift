//
//  ContentView.swift
//  Project18
//
//  Created by Matt Ridenhour on 5/19/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

extension VerticalAlignment {
    
    /*
     Using an enum instead of a struct will stop us
     from creating an instance of MidAccountAndName
     */
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }
    
    /*
     For some reason creating a static constant
     makes the cusom alignment easier to use.
     
     Still don't understand why
     */
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct ContentView: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@goofenhour")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center]}
                Image("Matt")
                .resizable()
                    .frame(width: 125, height:  125)
            }
            
            VStack {
                Text("Full name:")
                Text("Matt Ridenhour")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center]}
                    .font(.largeTitle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
