//
//  Day36.swift
//  Project7
//
//  Created by Matt Ridenhour on 11/16/19.
//  Copyright © 2019 Matt Ridenhour. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ObservedState: View {
    @ObservedObject private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

struct ObservedState_Previews: PreviewProvider {
    static var previews: some View {
        ObservedState()
    }
}
