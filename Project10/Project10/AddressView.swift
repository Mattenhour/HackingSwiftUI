//
//  AddressView.swift
//  Project10
//
//  Created by Matt Ridenhour on 1/23/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
