//
//  ShopView.swift
//  EcoEats
//
//  Created by Shengyuan Lu on 5/8/21.
//

import SwiftUI
import MapKit
import BottomSheet

struct ShopMapView: View {
    
    @State private var showCartView: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                
                Text("Locate a EcoEats partnered Store.")
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 16)
                
                MapView()
                    .onTapGesture {
                        self.endEditing()
                    }
                    .sheet(isPresented: $showCartView, content: {
                        CartView()
                    })
                
            }
            .navigationBarTitle(Text("Find a Store"))
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(trailing:
                                    
                                    Button(action: {

                                        self.showCartView.toggle()
                                        
                                    }, label: {
                                        
                                        HStack {
                                            Text("My Cart")
                                            Image(systemName: "cart.fill")
                                        }
                                        .padding(10)
                                        .foregroundColor(Color.init(hex: "54925A"))
                                        
                                    })
            )
                                
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
    
    @State private var text: String = ""
    
    @State var bottomSheetPosition: BottomSheetPosition = BottomSheetPosition.hidden
    
    private var poi = [
        AnnotatedItem(name: "VegiMart", coordinate: CLLocationCoordinate2D(latitude: 33.6570, longitude: -117.8016)),
        AnnotatedItem(name: "HMart Irvine", coordinate: CLLocationCoordinate2D(latitude: 33.6570, longitude: -117.8316)),
        AnnotatedItem(name: "FreshMart", coordinate: CLLocationCoordinate2D(latitude: 33.6300, longitude: -117.7996)),
        AnnotatedItem(name: "Farmer's Choice", coordinate: CLLocationCoordinate2D(latitude: 33.6469, longitude: -117.8630)),
    ]
    
    var body:some View {
        VStack {
            
            ZStack {
                
                Map(coordinateRegion: $managerDelegate.region, interactionModes: .pan, showsUserLocation: true, userTrackingMode: $trackingMode, annotationItems: poi) { item in
                    
                    MapAnnotation(coordinate: item.coordinate) {
                        
                        Button(action: {
                            
                            self.bottomSheetPosition = BottomSheetPosition.middle
                            
                        }, label: {
                            
                            Image(item.name)
                                .resizable()
                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color.init(hex: "54925A"))
                            
                        })
                        
                    }
                }
                
                VStack {
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.init(hex: "54925A"))
                            .font(.title2)
                        
                        TextField("Search...", text: $text)
                            .font(.title2)
                            .foregroundColor(.black)
                            .keyboardType(.default)
                            .environment(\.colorScheme, .light)
                        
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    .shadow(radius: 5)
                    
                    Spacer()
                    
                }
                
            }
            .bottomSheet(bottomSheetPosition: $bottomSheetPosition) {
                ItemView()
                    .padding()
            }
            .onAppear {
                manager.delegate = managerDelegate
            }
            
            

        }
        
        
    }
}

class LocationDelegate: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.6846, longitude: -117.8265), span: MKCoordinateSpan(latitudeDelta: 0.09, longitudeDelta: 0.09))
    
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

struct ShopMapView_Previews: PreviewProvider {
    static var previews: some View {
        ShopMapView()
    }
}
