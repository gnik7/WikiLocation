//
//  MapView.swift
//  WikiLocation
//
//  Created by Nikita Gil on 22.10.2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedItem: CLLocationCoordinate2D?

    var body: some View {
        ZStack {
            MapReader { reader in
                Map(){
                    Marker("",
                           coordinate: CLLocationCoordinate2D(
                            latitude: selectedItem?.latitude ?? (locationManager.lastSeenLocation?.coordinate.latitude ?? 0),
                            longitude: selectedItem?.longitude ?? (locationManager.lastSeenLocation?.coordinate.longitude ?? 0)))
                    }
                    .onTapGesture(perform: { screenCoord in
                        if let pinLocation = reader.convert(screenCoord, from: .local) {
                            selectedItem = pinLocation
                            print(pinLocation)
                        }
                    })
                }
        }
        .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                   
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
            })
    }
    
}

#Preview {
    MapView(selectedItem: .constant(CLLocationCoordinate2D(latitude: 0,longitude: 0)))
}
