//
//  ContentView.swift
//  Test
//
//  Created by Jordan Fraughton on 9/10/24.
//

import UserNotifications
import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false

        var body: some View {
            Button("Show Alert") {
                addNotification()
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("🚬A new PR!😎"), message: Text("4 packs today?? Nice! Keep it up!"), dismissButton: .default(Text("Another one maybe?")))
            }
        }
    
    func addNotification() {
        let center = UNUserNotificationCenter.current()

        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Smoke??🚬"
            content.subtitle = "It's been 45 minutes"
            content.sound = UNNotificationSound.default

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
