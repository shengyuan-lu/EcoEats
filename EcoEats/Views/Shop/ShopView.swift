//
//  ShopView.swift
//  EcoEats
//
//  Created by Shengyuan Lu on 5/8/21.
//

import SwiftUI
import MapKit

struct ShopView: View {
    var body: some View {
        
        NavigationView {
            
            
            VStack {
                MapView()
                    .navigationBarTitle(Text("Find a Store"))
                    .navigationBarTitleDisplayMode(.large)
            }
            
        }

    }
}

struct MapView: View {

    @State var trackingMode: MapUserTrackingMode = .follow
    @State var manager = CLLocationManager()
    @StateObject var managerDelegate = LocationDelegate()

    var body:some View {
        VStack {
            Map(coordinateRegion: $managerDelegate.region, interactionModes: .all, showsUserLocation: true, userTrackingMode: $trackingMode)
        }
        .onAppear {
            manager.delegate = managerDelegate
        }
    }
}

class LocationDelegate: NSObject, ObservableObject, CLLocationManagerDelegate {

    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.6846, longitude: -117.8265), latitudinalMeters: 10000, longitudinalMeters: 10000)

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            print("Authorized...")
            manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            manager.startUpdatingLocation()
        } else {
            print("Not Authorized...")
            manager.requestWhenInUseAuthorization()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        region.center.latitude = (manager.location?.coordinate.latitude)!
        region.center.longitude = (manager.location?.coordinate.longitude)!
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
