//
//  ContentView.swift
//  System Information
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
        }
        .toolbar(removing: .title)
        .toolbarBackground(.hidden, for: .windowToolbar)
        .containerBackground(.ultraThinMaterial, for: .window)
    }
}

#Preview {
    ContentView()
        .frame(width: 280, height: 455)
}
