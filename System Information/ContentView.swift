//
//  ContentView.swift
//  System Information
//

import Foundation
import SwiftUI

struct ContentView: View {
    // Variables
    @State private var expanded = false
    let macInfo = MacInfo()
    let table = "SPInfo"
    
    var body: some View {
        ZStack {
            if let iconImage = macInfo.color() {
//                Rectangle()
//                    .fill(
//                        LinearGradient(
//                            gradient: Gradient(colors: [
//                                Color(red: 80/255, green: 139/255, blue: 199/255),
//                                Color(red: 114/255, green: 176/255, blue: 239/255)
//                            ]),
//                            startPoint: .top,
//                            endPoint: .bottom
//                        )
//                    )
//                    .frame(width: 145, height: 95)
//                    .offset(y: -125)
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
                
                // Chip
                InfoLabel(title: "CHIP_LABEL".localize(table: table), subtitle: MGHelper.read(key: "Z06ZMtQY6G3kKrC7fs/gOA") ?? "UNKNOWN".localize(table: table))
                // Memory
                InfoLabel(title: "MEMORY_LABEL".localize(table: table), subtitle: "MEM_GIGABYTE_FORMAT".localize(table: table, MacInfo.memory))
                // Startup disk
                if macInfo.drives().count > 1 {
                    InfoLabel(title: "BOOT_DISK_LABEL".localize(table: table), subtitle: macInfo.drives().name)
                }
                // Serial Number
                InfoLabel(title: "SERIAL_LABEL".localize(table: table), subtitle: MGHelper.read(key: "VasUgeSzVyHdB27g2XpN0g") ?? "UNKNOWN".localize(table: table))
                // macOS
                InfoLabel(title: "OS_LABEL".localize(table: table), subtitle: expanded ? macInfo.system().subtext : "[\(macInfo.system().name) \(macInfo.system().version)](systemprofiler://)")
                
                Spacer()
                    .frame(height: 15)
                
                // More Info...
                Link("MORE_INFO_BUTTON".localize(table: table), destination: URL(string: "x-apple.systempreferences:com.apple.SystemProfiler.AboutExtension")!)
                    .buttonStyle(.bordered)
                
                Spacer()
                    .frame(height: 8)
                
                Group {
                    // Regulatory Certification
                    Button("REGULATORY_LABEL".localize(table: table)) {
                        macInfo.regulatoryFile()
                    }
                    .buttonStyle(.plain)
                    .underline()
                    // Copyright
                    Text("COPYRIGHT_LABEL".localize(table: table, "1983-2025 Apple Inc."))
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
            if url.scheme == "systemprofiler" {
                expanded = true
            }
        }
    }
}

#Preview {
    ContentView()
        .frame(width: 280, height: 455)
}
