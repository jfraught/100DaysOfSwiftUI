//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Jordan Fraughton on 8/31/24.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
