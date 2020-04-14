//
//  EnvLearning.swift
//  Project16
//
//  Created by Matt Ridenhour on 4/13/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView: View {
    @EnvironmentObject var user: User

    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User

    var body: some View {
        Text(user.name)
    }
}

struct EnvLearning: View {
    let user = User()
    
    var body: some View {
        VStack {
            EditView()
            DisplayView()
        }
        .environmentObject(user)
    }
}

struct EnvLearning_Previews: PreviewProvider {
    static var previews: some View {
        EnvLearning()
    }
}
