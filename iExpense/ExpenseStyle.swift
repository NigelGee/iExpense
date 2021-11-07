//
//  ExpenseStyle.swift
//  iExpense
//
//  Created by Nigel Gee on 06/11/2021.
//

import SwiftUI

struct ExpenseStyle: ViewModifier {
    let expenseItem: ExpenseItem

    func body(content: Content) -> some View {
        switch expenseItem.amount {
        case 0..<10:
            content
                .foregroundColor(.green)
        case 10..<100:
            content
                .foregroundColor(.blue)
        default:
            content
                .font(.headline)
                .foregroundColor(.red)
        }
    }
}

extension View {
    func expenseStyle(for expenseItem: ExpenseItem) -> some View {
        modifier(ExpenseStyle(expenseItem: expenseItem))
    }
}
