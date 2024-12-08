//
//  RealEstateMapView.swift
//  RealStateMarket Watch App
//
//  Created by Disira Thihan on 2024-06-11.
//


import SwiftUI
import MapKit

struct RealEstateMapView: View {
    let location: String

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Default location
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    @State private var annotations: [CustomMapAnnotation] = []
    @State private var showOpenMapsAlert = false

    func getCoordinates(for address: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if let error = error {
                print("Geocoding error: \(error.localizedDescription)")
                completion(nil)
            } else if let placemark = placemarks?.first,
                      let location = placemark.location {
                completion(location.coordinate)
            } else {
                completion(nil)
            }
        }
    }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Map(coordinateRegion: $region, annotationItems: annotations) { annotation in
                MapPin(coordinate: annotation.coordinate, tint: .blue)
            }
            .onAppear {
                getCoordinates(for: location) { coordinate in
                    if let coordinate = coordinate {
                        region.center = coordinate
                        let annotation = CustomMapAnnotation(coordinate: coordinate, title: location)
                        annotations.append(annotation)
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)

            Button(action: {
                showOpenMapsAlert.toggle()
            }) {
                Text("Dirrections")
                    .foregroundColor(.yellow)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Image(systemName: "map.fill")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .clipShape(Circle())
            }
            .padding(16)
            .alert(isPresented: $showOpenMapsAlert) {
                Alert(
                    title: Text("Open Maps"),
                    message: Text("Do you want to open Maps to get directions?"),
                    primaryButton: .default(Text("Open")) {
                        openMaps()
                    },
                    secondaryButton: .cancel()
                )
            }
        }
        .navigationTitle("Map")
    }

    private func openMaps() {
        let address = "\(location)"
        let mapURLString = "http://maps.apple.com/?address=\(address)"
        if let mapURL = URL(string: mapURLString) {
            WKExtension.shared().openSystemURL(mapURL)
        }
    }
}

struct CustomMapAnnotation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
}

struct RealEstateMapView_Previews: PreviewProvider {
    static var previews: some View {
        RealEstateMapView(location: "New York, NY")
    }
}
