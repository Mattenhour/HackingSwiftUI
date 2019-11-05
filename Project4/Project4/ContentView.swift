//
//  ContentView.swift
//  Project4
//
//  Created by Matt Ridenhour on 11/1/19.
//  Copyright © 2019 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("When do you want to wake up?")) {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                        .onTapGesture {
                            self.calculateBedTime()
                        }
                    }
                
                Section(header: Text("Desired amount of sleep")) {
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                    .onTapGesture {
                        self.calculateBedTime()
                    }
                }
                
                Section(header: Text("Daily coffee intake")) {
                    Picker(selection: $coffeeAmount, label: Text("Cups")) {
                        ForEach(0 ..< 21) {
                            Text("\($0)")
                        }
                    }
                    .onTapGesture(count: 1) {
                        self.calculateBedTime()
                    }
                    
//                    Stepper(value: $coffeeAmount, in: 1...20) {
//                        if coffeeAmount == 1 {
//                            Text("1 cup")
//                        } else {
//                            Text("\(coffeeAmount) cups")
//                        }
//                    }
                    
                }
                
                Section(header: Text("ideal bedtime")) {
                    Text(alertMessage)
                        .font(.largeTitle)
                }
                    
//                .alert(isPresented: $showingAlert) {
//                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
//                }
            }
            .onAppear(perform: self.calculateBedTime)
        .navigationBarTitle("Better Rest")
//        .navigationBarItems(trailing:
//            Button(action: calculateBedTime) {
//                Text("Calculate")
//            }
//        )
        }
    }
    
    static var defaultWakeTime: Date {
           var components = DateComponents()
           components.hour = 7
           components.minute = 0
           return Calendar.current.date(from: components) ?? Date()
       }
    
    func calculateBedTime() {
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try
            model.prediction(wake: Double(hour + minute),
                             estimatedSleep: sleepAmount,
                             coffee: Double(coffeeAmount)
            )
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short

            alertMessage = formatter.string(from: sleepTime)
            alertTitle = "Your ideal bedtime is…"
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
