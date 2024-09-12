//
//  PhotoPickerDay77App.swift
//  PhotoPickerDay77
//
//  Created by Jordan Fraughton on 9/5/24.
//

import SwiftUI

@main
struct PhotoPickerDay77App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: UserImage.self)
    }
}
