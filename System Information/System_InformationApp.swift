//
//  System_InformationApp.swift
//  System Information
//

import SwiftUI

@main
struct System_InformationApp: App {
    let macInfo = MacInfo()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .fixedSize()
                .frame(width: 280, height: macInfo.drives().count > 1 ? 470 : 455)
                .handlesExternalEvents(preferring: ["systemprofiler"], allowing: ["*"])
                .onReceive(NotificationCenter.default.publisher(for: NSWindow.didBecomeKeyNotification)) { notif in
                    if let window = notif.object as? NSWindow {
                        window.standardWindowButton(.miniaturizeButton)?.isEnabled = false
                    }
                    
                }
        }
        .windowResizability(.contentSize)
    }
}
