//
//  UserFriendView.swift
//  Milestone_Project_10-12
//
//  Created by Matt Ridenhour on 2/22/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI
import CoreData

struct UserFriendView: View {
    @Environment(\.managedObjectContext) var moc
    
    let friends: [Friend]
    
    func getFriendUser(friend: Friend) -> User {
        let request: NSFetchRequest = User.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", friend.wrappedID)
        
        guard let users = try? moc.fetch(request) else {
            return User()
        }
        
        return users.first ?? User()
    }
    
    var body: some View {
        List(friends, id: \.wrappedID) { friend in
            UserCellView(user: self.getFriendUser(friend: friend))
        }
    }
}

struct UserFriendView_Previews: PreviewProvider {
    static var previews: some View {
        UserFriendView(friends: [])
    }
}
