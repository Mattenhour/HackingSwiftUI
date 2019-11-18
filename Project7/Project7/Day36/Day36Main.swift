//
//  Day36Main.swift
//  Project7
//
//  Created by Matt Ridenhour on 11/17/19.
//  Copyright © 2019 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct Day36Main: View {
    @State private var exercises = ["ObservedState", "ShowHideView", "DeletingItems"]
    
    var body: some View {
        VStack {
            List {
                ForEach(exercises, id: \.self) { exercise in
                    NavigationLink(destination: self.LaunchView(exercise)) {
                        Text(exercise)
                    }
                }
            }
        }
    }
    
    func LaunchView(_ exercise: String) -> AnyView{
        switch exercise {
        case "ObservedState":
            return AnyView(ObservedState())
        case "ShowHideView":
            return AnyView(ShowHideView())
        default:
            return AnyView(DeletingItems())
        }
    }
}

struct Day36Main_Previews: PreviewProvider {
    static var previews: some View {
        Day36Main()
    }
}
