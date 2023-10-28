//
//  ContentView.swift
//  WikiLocation
//
//  Created by Nikita Gil on 22.10.2023.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            LocationsView()
        }
        .navigationViewStyle(.stack)
        .environmentObject(LocationManager())
    }
}

#Preview {
    ContentView()
        .environmentObject(LocationManager())
}
