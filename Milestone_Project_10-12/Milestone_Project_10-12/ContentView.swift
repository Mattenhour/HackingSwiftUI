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
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.self) { user in
//                    NavigationLink(destination: DetailView(friendFace: self.friendFace, user: person)) {
//                       UserCellView(user: person)
//
//                    }
                     Text(user.wrappedName)
                }
            }
            .navigationBarTitle(Text("FriendFace"))
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
