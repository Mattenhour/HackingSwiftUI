//
//  DetailView.swift
//  Milestone_Project_10-12
//
//  Created by Matt Ridenhour on 2/17/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let user: User
    
    var firstName: String {
        String(user.wrappedName.split(separator: " ").first ?? Substring())
    }
    
    var body: some View {
        Form {
            Section {
                Text(user.wrappedCompany)
                Text(user.wrappedEmail)
                Text(user.wrappedAddress)
            }
            
            Section(header: Text("About")) {
                Text(user.wrappedAbout)
            }
            
            Section(header: Text("Friends")) {
                NavigationLink(destination: UserFriendView(friends: user.wrappedFriends)) {
                    Text("\(firstName) has \(user.wrappedFriends.count) friends")
                }
            }
        }
        .navigationBarTitle(Text("\(user.wrappedName) (\(user.wrappedAge))"), displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailView(user: User())
    }
}
