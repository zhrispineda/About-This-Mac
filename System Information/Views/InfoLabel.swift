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
                .frame(width: 100, alignment: .trailing)
            Spacer()
                .frame(width: 10)
            Text(subtitle)
                .foregroundStyle(.secondary)
                .tint(.secondary)
                .textSelection(.enabled)
                .monospaced(title == "SERIAL_LABEL")
                .help("")
                .frame(width: 100, alignment: .leading)
        }
        .font(.subheadline)
        .offset(x: -12)
    }
}

#Preview {
    InfoLabel()
}
