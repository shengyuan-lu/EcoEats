//
//  ShopView.swift
//  EcoEats
//
//  Created by Shengyuan Lu on 5/8/21.
//

import SwiftUI
import MapKit

struct ShopView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                MapView()
                    .navigationBarTitle(Text("Find a Store"))
                    .navigationBarTitleDisplayMode(.large)
                
                VStack {
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.init(hex: "54925A"))
                            .font(.title)
                            
                        TextField("Search...", text: $text)
                            .font(.title2)
                            .foregroundColor(.black)
                            .keyboardType(.default)
                            .padding(10)
                            .environment(\.colorScheme, .light)

                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 8)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    .shadow(radius: 5)
                    
                    Spacer()
                    
                }


            }
            .onTapGesture {
                self.endEditing()
            }
        }


        
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

struct MapView: View {
    
    @State var trackingMode: MapUserTrackingMode = MapUserTrackingMode.follow
    @State var manager = CLLocationManager()
    @StateObject var managerDelegate = LocationDelegate()
    
    private var poi = [
        AnnotatedItem(name: "VegiMart Irvine", coordinate: CLLocationCoordinate2D(latitude: 33.6570, longitude: -117.8316)),
        AnnotatedItem(name: "VegiMart Irvine", coordinate: CLLocationCoordinate2D(latitude: 33.6590, longitude: -117.8216)),
        AnnotatedItem(name: "VegiMart Irvine", coordinate: CLLocationCoordinate2D(latitude: 33.6570, longitude: -117.8316)),
        AnnotatedItem(name: "VegiMart Irvine", coordinate: CLLocationCoordinate2D(latitude: 33.6300, longitude: -117.7996)),
        AnnotatedItem(name: "VegiMart Irvine", coordinate: CLLocationCoordinate2D(latitude: 33.6469, longitude: -117.8630)),
    ]
    
    var body:some View {
        VStack {
            
            Map(coordinateRegion: $managerDelegate.region, interactionModes: .pan, showsUserLocation: true, userTrackingMode: $trackingMode, annotationItems: poi) { item in

                MapAnnotation(coordinate: item.coordinate) {
                    Image("Icon")
                }
            }
            
        }
        .onAppear {
            manager.delegate = managerDelegate
        }
    }
}

class LocationDelegate: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.6846, longitude: -117.8265), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var updateCount = 0
    
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
        
        if updateCount == 0 {
            region.center.latitude = (manager.location?.coordinate.latitude)!
            region.center.longitude = (manager.location?.coordinate.longitude)!
            updateCount += 1
        }
        
    }
}

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
