//
//  Expense.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2023-08-15.
//

import SwiftUI

struct Expense: Identifiable,Hashable{
    var id = UUID().uuidString
    var remark: String
    var amount: Double
    var date: Date
    var type: ExpenseType
    var color: String
}

enum ExpenseType: String{
    case income = "Income"
    case expense = "expenses"
    case all = "ALL"
}

var sample_expenses: [Expense] = [
    Expense(remark: "Magic Keyboard", amount: 99, date: Date(timeIntervalSince1970: 1652987245), type: .expense, color: "Yellow"),
    Expense(remark: "Food", amount: 19, date: Date(timeIntervalSince1970: 1652814445), type: .expense, color: "Red"),
    Expense(remark: "Magic Trackpad", amount: 99, date: Date(timeIntervalSince1970: 1652382445), type: .expense, color: "Purple"),
    Expense(remark: "Uber Cab", amount: 20, date: Date(timeIntervalSince1970: 1652296045), type: .expense, color: "Green"),
    Expense(remark: "Amazon Purchase", amount: 299, date: Date(timeIntervalSince1970: 1652209645), type: .expense, color: "Yellow"),
    Expense(remark: "Stocks", amount: 2599, date: Date(timeIntervalSince1970: 1652036845), type: .expense, color: "Purple"),
    Expense(remark: "In App Purchase", amount: 499, date: Date(timeIntervalSince1970: 1651864045), type: .expense, color: "Red"),
    Expense(remark: "Movie Ticket", amount: 99, date: Date(timeIntervalSince1970: 1651691245), type: .expense, color: "Yellow"),
    Expense(remark: "Apple Music", amount: 25, date: Date(timeIntervalSince1970: 1651518445), type: .expense, color: "Green"),
    Expense(remark: "Snacks", amount: 49, date: Date(timeIntervalSince1970: 1651432045), type: .expense, color: "Purple"),
]
