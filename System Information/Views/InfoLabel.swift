//
//  InfoLabel.swift
//  System Information
//

import SwiftUI

struct InfoLabel: View {
    var title = String()
    var subtitle = String()
    @State private var expanded = false
    
    var body: some View {
        HStack {
            Text(title)
                .frame(width: 100, alignment: .trailing)
            Spacer()
                .frame(width: 10)
            Text(.init(subtitle))
                .foregroundStyle(.secondary)
                .tint(.secondary)
                .textSelection(.enabled)
                .monospaced(title == "SERIAL_LABEL".localize(table: "SPInfo"))
                .help("")
                .frame(width: expanded ? 120 : 100, alignment: .leading)
        }
        .font(.subheadline)
        .offset(x: -12)
        .onOpenURL { url in // Expand frame width for OS label value when text is clicked
            if url.scheme == "systemprofiler" {
                expanded = true
            }
        }
    }
}

#Preview {
    InfoLabel()
}
