//
//  ContentView.swift
//  System Information
//

import SwiftUI

struct ContentView: View {
    // Variables
    var iconPath = "/System/Library/CoreServices/CoreTypes.bundle/Contents/Library/CoreTypes-0013.bundle/Contents/Resources/com.apple.macbookpro-16-late-2023-2-space-black.icns"
    var iconImage: NSImage? {
        let fileURL = URL(fileURLWithPath: iconPath)
        return NSImage(contentsOf: fileURL)
    }
    
    var body: some View {
        ZStack {
            if let iconImage = iconImage {
                Image(nsImage: iconImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 190)
                    .offset(y: -129)
            }
            
            VStack(spacing: 2.5) {
                Spacer()
                    .frame(height: 174)
                Text("UNKNOWN")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary.opacity(0.8))
                Text("UNKNOWN")
                    .font(.caption)
                    .foregroundStyle(.tertiary)
                Spacer()
                    .frame(height: 15)
                InfoLabel(title: "CHIP_LABEL", subtitle: "UNKNOWN")
                InfoLabel(title: "MEMORY_LABEL", subtitle: "UNKNOWN")
                InfoLabel(title: "SERIAL_LABEL", subtitle: "UNKNOWN")
                InfoLabel(title: "OS_LABEL", subtitle: "UNKNOWN")
                Spacer()
                    .frame(height: 15)
                Link("MORE_INFO_BUTTON", destination: URL(string: "x-apple.systempreferences:com.apple.SystemProfiler.AboutExtension")!)
                    .buttonStyle(.bordered)
                Spacer()
                    .frame(height: 8)
                Group {
                    Button("REGULATORY_LABEL") {
                        
                    }
                    .buttonStyle(.plain)
                    .underline()
                    Text("COPYRIGHT_LABEL")
                        .multilineTextAlignment(.center)
                }
                .foregroundStyle(.tertiary)
                .font(.subheadline)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .textSelection(.enabled)
        }
        .containerBackground(.ultraThinMaterial, for: .window)
        .gesture(WindowDragGesture())
        .toolbar(removing: .title)
        .toolbarBackground(.hidden, for: .windowToolbar)
    }
}

#Preview {
    ContentView()
        .frame(width: 280, height: 455)
}
