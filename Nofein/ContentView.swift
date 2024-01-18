//
//  ContentView.swift
//  Nofein
//
//  Created by 권민재 on 1/14/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                WaveEffect()
                    .navigationBarTitle("First Tab", displayMode: .inline)
                    .tag(0)
                    .tabItem {
                        Image(systemName: "1.square.fill")
                        Text("First")
                    }
            }
            Text("Second")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
            Text("Third")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }
        }
    }
}

#Preview {
    ContentView()
}
