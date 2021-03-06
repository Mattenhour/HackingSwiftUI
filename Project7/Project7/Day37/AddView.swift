//
//  AddView.swift
//  Project7
//
//  Created by Matt Ridenhour on 11/18/19.
//  Copyright © 2019 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    @State private var showError = false
    
    @State private var message = ""
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    self.showError = true
                    self.errorMessage()
                }
            })
        }
        .alert(isPresented: $showError) {
            Alert(title: Text("Conversion error"), message: Text("\(self.message)"), dismissButton: .default(Text("Okay")))
        }
    }
    
    func errorMessage() {
        self.message = "\(self.amount) is not a number"
        self.name = ""
        self.amount = ""
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
