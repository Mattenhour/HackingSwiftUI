//
//  ContentView.swift
//  Project1 challenge
//
//  Created by Matt Ridenhour on 10/25/19.
//  Copyright © 2019 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var temp = ""
    @State private var inputSelection = 0
    @State private var outputSelection = 0

    let tempUnit = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convertedTemp: Double {
        var baseUnit: Measurement<UnitTemperature>
        
        
        let startTemp = Double(temp) ?? 0
        
        baseUnit = convertToBaseUnit(startTemp)
        
        let outTemp = convertToOutputTemp(baseUnit)
        print(outTemp)
        return outTemp
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Tempeture", text: $temp)
                        .keyboardType(.decimalPad)
                    
                    Picker("Degree", selection: $inputSelection){
                        ForEach(0 ..< tempUnit.count){
                            Text("\(self.tempUnit[$0])")
                        }
                    }
                }
                Section {
                    Picker("To", selection: $outputSelection){
                        ForEach(0 ..< tempUnit.count){
                            Text("\(self.tempUnit[$0])")
                        }
                    }
                }
                Section {
                    Text("\(convertedTemp, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("Unit Conversion")
        }
    }
    
    func convertToBaseUnit(_ temp: Double) -> Measurement<UnitTemperature> {
        var tempKelvin: Measurement<UnitTemperature>
        
        //check if temp is already in Kelvin
        if tempUnit[inputSelection] == "Kelvin"{
            tempKelvin = Measurement(value: temp, unit: UnitTemperature.kelvin)
            return tempKelvin
        }
        
        if tempUnit[inputSelection] == "Celsius" {
            let tempCelsius = Measurement(value: temp, unit: UnitTemperature.celsius)
            tempKelvin = tempCelsius.converted(to: UnitTemperature.kelvin)
            
        } else {
            let tempFahrenheit = Measurement(value: temp, unit: UnitTemperature.fahrenheit)
            tempKelvin = tempFahrenheit.converted(to: UnitTemperature.kelvin)
        }
        
        return tempKelvin
    }
    
    func convertToOutputTemp(_ temp: Measurement<UnitTemperature>) -> Double {
        var doubleTemp: Double
        
        if tempUnit[outputSelection] == "Kelvin" {
            doubleTemp = temp.converted(to: UnitTemperature.kelvin).value
            return doubleTemp
        }
        
        if tempUnit[outputSelection] == "Celsius" {
            doubleTemp = temp.converted(to: .celsius).value
        } else {
            doubleTemp = temp.converted(to: .fahrenheit).value
        }
        
        return doubleTemp
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
