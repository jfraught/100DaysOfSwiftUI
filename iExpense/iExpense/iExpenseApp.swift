//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Jordan Fraughton on 8/27/24.
//

import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
