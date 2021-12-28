//
//  ExpenseSectionView.swift
//  iExpense
//
//  Created by Nigel Gee on 07/11/2021.
//

import SwiftUI

struct ExpenseSectionView: View {
    let title: ExpenseItem.Types
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void

    var body: some View {
        Section {
            ForEach(expenses) { item in
                VStack(alignment: .leading) {
                    HStack {
                        Text(item.name)
                            .font(.headline)

                        Spacer()

                        Text(item.amount, format: .localCurrency)
                    }
                    .expenseStyle(for: item)

                    Text(item.description)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }
                .accessibilityElement()
                .accessibilityLabel("\(item.name) , \(item.amount.formatted(.localCurrency))")
                .accessibilityHint(item.description)
            }
            .onDelete(perform: deleteItems)
        } header: {
            HStack {
                Text(title.rawValue.capitalized)
                Spacer()
                Text(totalAmount(for: expenses), format: .localCurrency)
            }
        }
    }

    func totalAmount(for expenseItem: [ExpenseItem]) -> Double {
        expenseItem.map { $0.amount }.reduce(0, +)
    }
}

struct ExpenseSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseSectionView(title: .business, expenses: []) { _ in }
    }
}
