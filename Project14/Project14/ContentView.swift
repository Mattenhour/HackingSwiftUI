//
//  ContentView.swift
//  Project14
//
//  Created by Matt Ridenhour on 3/16/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import LocalAuthentication
import MapKit
import SwiftUI

struct ContentView: View {
    @State private var isUnlocked = false
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showErrorAlert = false
    
    var body: some View {
        Group {
            if isUnlocked {
                MapContentView()
            } else {
                Button("Unlock places") {
                    self.authenticate()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .clipShape(Capsule())
                
                .alert(isPresented: $showErrorAlert) {
                    Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
    
    func authenticate() {
        
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reasons = "Please authenticate yourself to unlock your places."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reasons) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        // error
                        self.errorTitle = "Couldn't unlock"
                        self.errorMessage = "Your face wasn't recognized."
                        self.showErrorAlert = true
                    }
                }
            }
        } else {
            // Biometrics not supported
            self.errorTitle = "Can't unlock!"
            self.errorMessage = "Your device doesn't support authentication with biometrics."
            self.showErrorAlert = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
