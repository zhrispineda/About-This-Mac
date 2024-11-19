//
//  ContentView.swift
//  System Information
//

import Foundation
import SwiftUI

struct ContentView: View {
    // Variables
    var iconPath = "/System/Library/CoreServices/CoreTypes.bundle/Contents/Library/CoreTypes-0013.bundle/Contents/Resources/com.apple.macbookpro-16-late-2023-2-space-black.icns"
    var iconImage: NSImage? {
        let fileURL = URL(fileURLWithPath: iconPath)
        return NSImage(contentsOf: fileURL)
    }
    let table = "SPInfo"
    let macInfo = MacInfo()
    @State private var expanded = false
    
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
                Text(macInfo.model().name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary.opacity(0.8))
                Text(macInfo.model().year)
                    .font(.caption)
                    .foregroundStyle(.tertiary)
                Spacer()
                    .frame(height: 15)
                InfoLabel(title: "CHIP_LABEL".localize(table: table), subtitle: MGHelper.read(key: "Z06ZMtQY6G3kKrC7fs/gOA") ?? "UNKNOWN".localize(table: table))
                InfoLabel(title: "MEMORY_LABEL".localize(table: table), subtitle: "MEM_GIGABYTE_FORMAT".localize(table: table, MacInfo.memory))
                InfoLabel(title: "SERIAL_LABEL".localize(table: table), subtitle: MGHelper.read(key: "VasUgeSzVyHdB27g2XpN0g") ?? "UNKNOWN".localize(table: table))
                InfoLabel(title: "OS_LABEL".localize(table: table), subtitle: expanded ? macInfo.system().build : "[\(macInfo.system().version)](systemprofiler://)")
                Spacer()
                    .frame(height: 15)
                Link("MORE_INFO_BUTTON".localize(table: table), destination: URL(string: "x-apple.systempreferences:com.apple.SystemProfiler.AboutExtension")!)
                    .buttonStyle(.bordered)
                Spacer()
                    .frame(height: 8)
                Group {
                    Button("REGULATORY_LABEL".localize(table: table)) {
                        
                    }
                    .buttonStyle(.plain)
                    .underline()
                    Text("COPYRIGHT_LABEL".localize(table: table, "1983-2024 Apple Inc."))
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
        .onOpenURL { url in // Replace text value for OS label subtitle when text is clicked
            if url.absoluteString == "systemprofiler://" {
                expanded = true
            }
        }
    }
}

#Preview {
    ContentView()
        .frame(width: 280, height: 455)
}
