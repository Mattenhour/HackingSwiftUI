//
//  ShowHideView.swift
//  Project7
//
//  Created by Matt Ridenhour on 11/16/19.
//  Copyright © 2019 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    var name: String
    
    var body: some View {
        Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ShowHideView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            // show the sheet
            self.showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            // contents of the sheet
            SecondView(name: "Mattenhour")
        }
    }
}

struct ShowHideView_Previews: PreviewProvider {
    static var previews: some View {
        ShowHideView()
    }
}
