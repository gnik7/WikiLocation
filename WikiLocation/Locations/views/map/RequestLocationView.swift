//
//  RequestLocationView.swift
//  WikiLocation
//
//  Created by Nikita Gil on 22.10.2023.
//

import SwiftUI
import CoreLocationUI

struct RequestLocationView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
      VStack {
          Text(
          """
          For using map, first, you need to
          share your current location.
          """
        )
          .multilineTextAlignment(.center)
        LocationButton {
          locationManager.requestWhenInUseAuthorization()
        }
        .symbolVariant(.fill)
        .foregroundColor(.white)
        .cornerRadius(8)
      }
      .padding()
      .onAppear {
        locationManager.updateAuthorizationStatus()
      }
    }

    func startUpdatingLocation() {
      locationManager.startUpdatingLocation()
    }
}

#Preview {
    RequestLocationView()
        .environmentObject(LocationManager())
}
