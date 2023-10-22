//
//  LocationRow.swift
//  WikiLocation
//
//  Created by Nikita Gil on 22.10.2023.
//

import SwiftUI

struct LocationRow: View {
    let location: LocationItem
    
    var body: some View {
        VStack(alignment: .leading) {
          Text(location.name ?? "undefind")
            .multilineTextAlignment(.center)
            .font(.title3)
        }
    }
}

#Preview {
    //TODO: create mock
    let item = LocationItem(name: "rrr", lat: 40.5, long: 40.5)
    return LocationRow(location: item)
}
