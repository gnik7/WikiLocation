//
//  LocationsRequest.swift
//  WikiLocation
//
//  Created by Nikita Gil on 22.10.2023.
//

import Foundation

enum LocationsRequest: RequestProtocol {
    case loadLocations
    
    var path: String {
        switch self {
            case .loadLocations: return  "/abnamrocoesd/assignment-ios/main/locations.json"
        }
    }

    var urlParams: [String: String?]? {
        return nil
    }

    var requestType: RequestType {
        .GET
    }
    
    private var parameters: [URLQueryItem] {
        return []
    }
}

