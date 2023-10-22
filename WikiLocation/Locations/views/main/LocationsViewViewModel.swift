//
//  LocationsViewViewModel.swift
//  WikiLocation
//
//  Created by Nikita Gil on 22.10.2023.
//

import SwiftUI

class LocationsViewViewModel {
    
    private let requestManager = RequestManager()
    
    // MARK: - Api Call
    
    func fetchLocations() async -> ([LocationItem], String?) {
      do {
          let locationsContainer: LocationContainer = try await requestManager.perform(LocationsRequest.loadLocations)
          return (locationsContainer.locations, nil)
      } catch  {
          return ([], error.localizedDescription)
      }
    }
    
    // MARK: - Open Url
    
    func openLocation(name: String) -> URL {
        return URL(string: "wikipedia://places?WMFArticleURL=https://en.wikipedia.org/" + name.lowercased()) ?? URL(string: "https://apple.com")!
    }
    
    func openLocation(locationItem: LocationItem) -> URL {
        guard let latitude = locationItem.lat, 
                let longtitude = locationItem.long else {return URL(string: "https://apple.com")!}
        
        return URL(string: "wikipedia://places?WMFArticleURL=https://en.wikipedia.org/latitude=\(latitude)_longtitude=\(longtitude)")
                ?? URL(string: "https://apple.com")!
    }
    
}
