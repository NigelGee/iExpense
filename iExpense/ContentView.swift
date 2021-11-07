//
//  ContentView.swift
//  iExpense
//
//  Created by Nigel Gee on 06/11/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                if expenses.businessItems.isNotEmpty {
                    ExpenseSectionView(
                        title: .business,
                        expenses: expenses.businessItems,
                        deleteItems: removeBusinessItems
                    )
                }

                if expenses.personalItems.isNotEmpty {
                    ExpenseSectionView(
                        title: .personal,
                        expenses: expenses.personalItems,
                        deleteItems: removePersonalItems
                    )
                }
            }

            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }

    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var objectToDelete = IndexSet()
        for offset in offsets {
            let item = inputArray[offset]

            if let index = expenses.items.firstIndex(of: item) {
                objectToDelete.insert(index)
            }
        }
        expenses.items.remove(atOffsets: objectToDelete)
    }

    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
    }

    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
