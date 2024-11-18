//
//  System_InformationApp.swift
//  System Information
//

import SwiftUI

@main
struct System_InformationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .fixedSize()
                .frame(width: 280, height: 455)
                .onReceive(NotificationCenter.default.publisher(for: NSWindow.didBecomeKeyNotification)) { notif in
                    if let window = notif.object as? NSWindow {
                        window.standardWindowButton(.miniaturizeButton)?.isEnabled = false
                    }
                    
                }
        }
        .windowResizability(.contentSize)
    }
}
