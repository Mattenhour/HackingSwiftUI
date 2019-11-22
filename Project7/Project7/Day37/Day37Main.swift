//
//  Day37Main.swift
//  Project7
//
//  Created by Matt Ridenhour on 11/17/19.
//  Copyright © 2019 Matt Ridenhour. All rights reserved.
//

import SwiftUI

struct Day37Main: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        List {
            ForEach(expenses.items) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }

                    Spacer()
                    Text("$\(item.amount)")
                        .foregroundColor(self.amountColor(item.amount))
                }
            }
            .onDelete(perform: removeItems)
        }
        .navigationBarTitle("iExpense")
        .navigationBarItems(trailing:
            Button(action: {
                self.showingAddExpense = true
                
            }) {
                Image(systemName: "plus")
            }
        )
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: self.expenses)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func amountColor(_ amount: Int) -> Color {
        if amount < 10 {
            return Color.green
        } else if amount < 100 {
            return Color.black
        } else {
            return Color.red
        }
        
    }
}

struct Day37Main_Previews: PreviewProvider {
    static var previews: some View {
        Day37Main()
    }
}
