//
//  ShopViewMain.swift
//  EcoEats
//
//  Created by Shengyuan Lu on 5/8/21.
//

import SwiftUI

struct MainShopView: View {
    
    @Binding var isLoggedin:Bool
    
    @State var tabSelection: Int = 0
    
    var body: some View {
        
        TabView(selection: $tabSelection)  {
            
            PromoView(isLoggedin: $isLoggedin)
                .tag(0)
                .tabItem {
                    Label("Get Started", image: "ecology-leaf")
                }
            
            ShopView()
                .tag(1)
                .tabItem {
                    Label("Shop", image: "shop")
                }
            
        }
        .onAppear(perform: {
            UIScrollView.appearance().bounces = true
        })
        .accentColor(Color.init(hex: "54925A"))
        
    }
    
}

struct ShopViewMain_Previews: PreviewProvider {
    static var previews: some View {
        MainShopView(isLoggedin: .constant(true))
    }
}
