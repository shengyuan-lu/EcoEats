//
//  ShopViewMain.swift
//  EcoEats
//
//  Created by Shengyuan Lu on 5/8/21.
//

import SwiftUI

struct MainAppView: View {
    
    @Binding var isLoggedin:Bool
    
    @State var tabSelection: Int = 0
    
    var body: some View {
        
        TabView(selection: $tabSelection)  {
            
            PromoView(isLoggedin: $isLoggedin, tabSelection: $tabSelection)
                .tag(0)
                .tabItem {
                    Label("Get Started", image: "ecology-leaf")
                }
            
            ShopMapView()
                .tag(1)
                .tabItem {
                    Label("Shop", image: "shop")
                }
            
            ProfileView()
                .tag(2)
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
            
        }
        .onAppear(perform: {
            UIScrollView.appearance().bounces = true
        })
        .accentColor(Color.init(hex: "54925A"))
        
    }
    
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView(isLoggedin: .constant(true))
    }
}
