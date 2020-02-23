//
//  UserCellView.swift
//  Milestone_Project_10-12
//
//  Created by Matt Ridenhour on 2/17/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct UserCellView: View {
    var user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(user.wrappedName) (\(user.wrappedAge))")
                .font(.headline)
                .foregroundColor(.primary)
            }
        }
    }
}

struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserCellView(user: User())
    }
}
