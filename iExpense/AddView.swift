//
//  AddView.swift
//  iExpense
//
//  Created by Nigel Gee on 06/11/2021.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var expenses: Expenses

    @State private var name = ""
    @State private var description = ""
    @State private var type = ExpenseItem.Types.personal
    @State private var amount = 0.0

    var body: some View {
        NavigationView {
            Form {
                Picker("Type", selection: $type) {
                    ForEach(ExpenseItem.Types.allCases, id: \.self) {
                        Text($0.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                
                TextField("Name", text: $name)
                    .textFieldStyle(.roundedBorder)

                TextField("Amount", value: $amount, format: .localCurrency)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)

                TextField("Description of expense", text: $description)
                    .textFieldStyle(.roundedBorder)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, description: description, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
