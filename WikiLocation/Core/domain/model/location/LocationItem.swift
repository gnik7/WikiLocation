//
//  LocationItem.swift
//  WikiLocation
//
//  Created by Nikita Gil on 22.10.2023.
//

import MapKit

struct LocationItem: Decodable {
    let name: String?
    let lat: CLLocationDegrees?
    let long: CLLocationDegrees?
}

// MARK: - Identifiable
extension LocationItem: Identifiable {
    var id: UUID {
        return UUID()
    }
}


