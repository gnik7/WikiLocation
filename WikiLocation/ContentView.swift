//
//  ContentView.swift
//  WikiLocation
//
//  Created by Nikita Gil on 22.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        NavigationView {
            LocationsView()
        }
        .navigationViewStyle(.stack)
        .environmentObject(locationManager)
    }
}

#Preview {
    ContentView()
        .environmentObject(LocationManager())
}
