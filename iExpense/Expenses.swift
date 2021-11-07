//
//  Expenses.swift
//  iExpense
//
//  Created by Nigel Gee on 06/11/2021.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }

    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }

    var personalItems: [ExpenseItem] {
        items.filter { $0.type == .personal }
    }

    var businessItems: [ExpenseItem] {
        items.filter { $0.type == .business }
    }
}
