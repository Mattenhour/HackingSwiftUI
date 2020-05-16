//
//  SettingsView.swift
//  Project17
//
//  Created by Matt Ridenhour on 5/15/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var isOnShuffled: Bool
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $isOnShuffled) {
                    Text("Reshuffle wrong answered cards")
                }
            }
            .navigationBarTitle("Settings")
            .navigationBarItems(trailing: Button("Done", action: dismiss))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
