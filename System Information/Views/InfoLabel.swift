//
//  InfoLabel.swift
//  System Information
//

import SwiftUI

struct InfoLabel: View {
    var title = String()
    var subtitle = String()
    
    var body: some View {
        HStack {
            Text(title)
                .frame(width: 120, alignment: .trailing)
            Spacer()
                .frame(width: 10)
            Text(.init(subtitle))
                .foregroundStyle(.secondary)
                .tint(.secondary)
                .textSelection(.enabled)
                .monospaced(title == "SERIAL_LABEL".localize(table: "SPInfo"))
                .help("")
                .frame(width: 120, alignment: .leading)
        }
        .font(.subheadline)
        .offset(x: -12)
    }
}

#Preview {
    ContentView()
}
