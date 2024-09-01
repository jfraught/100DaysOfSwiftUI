//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Jordan Fraughton on 8/31/24.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
