//
//  LocationsRequest.swift
//  WikiLocation
//
//  Created by Nikita Gil on 22.10.2023.
//

enum LocationsRequest: RequestProtocol {
    case loadLocations
    
    var path: String {
        "/abnamrocoesd/assignment-ios/main/locations.json"
    }

    var urlParams: [String: String?]? {
        return nil
    }

    var requestType: RequestType {
        .GET
    }
}

