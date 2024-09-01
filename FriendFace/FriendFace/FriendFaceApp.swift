//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Jordan Fraughton on 9/1/24.
//

import SwiftData
import SwiftUI

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
