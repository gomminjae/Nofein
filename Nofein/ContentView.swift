//
//  ContentView.swift
//  Nofein
//
//  Created by 권민재 on 1/14/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            Text("Hello, World!")
                .navigationTitle("Nofein")
        } detail: {
            Text("Hello")
        }
    }
}

#Preview {
    ContentView()
}
