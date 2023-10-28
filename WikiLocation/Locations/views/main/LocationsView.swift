//
//  LocationsView.swift
//  WikiLocation
//
//  Created by Nikita Gil on 22.10.2023.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @Environment(\.openURL) private var openURL
    @EnvironmentObject var locationManager: LocationManager
    
    private let viewModel = LocationsViewViewModel()
    
    @State var locations: [LocationItem] = []
    @State var isLoading = true
    @State private var searchText : String = ""
    @State private var showingAlert = false
    @State private var selectedItem: CLLocationCoordinate2D?
    @State private var errorMessage = "Error Text"
    
    var body: some View {
    
        List {
            ForEach(locations) { location in
              LocationRow(location: location)
                .onTapGesture {
                    if let name = location.name {
                        let url = viewModel.openLocation(name: name)
                        openURL(url) { accepted in
                            if !accepted {
                                errorMessage = "Can not open"
                                showingAlert.toggle()
                            }
                        }
                    } else {
                        let url = viewModel.openLocation(locationItem: location)
                        openURL(url) { accepted in
                            if !accepted {
                                errorMessage = "Can not open"
                                showingAlert.toggle()
                            }
                        }
                    }
                }
            }
        }
        .task {
            await fetchLocations()
        }
        .refreshable {
            await fetchLocations()
        }
        .navigationBarTitle(Text("Locations List"),
                         displayMode: .inline)
        .navigationBarItems(leading: Button(action: {}, label: {
            NavigationLink(
                destination: showMapOrRequest()
            ) {
                Image(systemName: "globe.europe.africa.fill")
            }
            
            .onAppear {
                guard let location = selectedItem else {return}
                let url = viewModel.openLocation(
                    locationItem: LocationItem(
                        name: nil,
                        lat: location.latitude,
                        long: location.longitude))
                openURL(url)
            }
        })
        )
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer(
                        displayMode: .always),
                    prompt: "Search")
        .onSubmit(of: .search) {
            let url =  viewModel.openLocation(
                name: $searchText.wrappedValue
            )
            openURL(url)
           }
        .overlay {
            if isLoading {
              ProgressView("Loading locations...")
            }
        }
        .alert(
            errorMessage,
            isPresented: $showingAlert) {
                Button("OK", role: .cancel) { 
                    showingAlert.toggle()
                }
            }
    }
    
    @MainActor
    func stopLoading() async {
      isLoading = false
    }
    
    func fetchLocations() async {
        let (locations, error) =  await viewModel.fetchLocations()
        self.locations = locations
        
        await stopLoading()
        
        if let error {
            errorMessage = error
            showingAlert.toggle()
        }
    }

    func showMapOrRequest() -> some View {
     
        if locationManager.locationIsDisabled {
            return AnyView(RequestLocationView())
        } else {
            return AnyView(MapView(selectedItem: $selectedItem))
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationManager())
}
