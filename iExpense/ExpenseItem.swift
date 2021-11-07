//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Nigel Gee on 06/11/2021.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let description: String
    let type: Types
    let amount: Double

    enum Types: String, CaseIterable, Codable {
        case personal, business
    }
}
