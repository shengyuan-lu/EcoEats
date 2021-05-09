//
//  ShopViewMain.swift
//  EcoEats
//
//  Created by Shengyuan Lu on 5/8/21.
//

import SwiftUI

struct MainShopView: View {
    
    @Binding var isLoggedin:Bool
    
    var body: some View {
        Text("Shopview here")
        
        Button(action: {
            
            self.isLoggedin = false
            
        }, label: {
            Text("Log out")
        })
    }
    
}

struct ShopViewMain_Previews: PreviewProvider {
    static var previews: some View {
        MainShopView(isLoggedin: .constant(true))
    }
}
