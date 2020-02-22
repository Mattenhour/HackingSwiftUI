//
//  DetailView.swift
//  Milestone_Project_10-12
//
//  Created by Matt Ridenhour on 2/17/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var friendFace: FriendFace
    
    var user: JSONUser
    
    var body: some View {
        Form {
            Section {
                Text(user.company)
                Text(user.email)
                Text(user.address)
            }
            
            Section(header: Text("About")) {
                Text(user.about)
            }
            
            Section(header: Text("Friends")) {
                List(user.friends) { friend in
                    UserCellView(user: self.friendFace.findPerson(byId: friend.id)!)
                }
            }
        }
        .navigationBarTitle(Text("\(user.name) (\(user.age))"), displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(friendFace: FriendFace(), user: JSONUser(id: "50a48fa3-2c0f-4397-ac50-64da464f9954", isActive: false, name: "Alford Rodriguez", age: 21, company: "Imkan", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered:  Date(), tags: ["one", "two", "three"], friends: [JSONUser.JSONFriend(id: "", name: "asd"), JSONUser.JSONFriend(id: "", name: "asd")]))
    }
}
