//
//  TabController.swift
//  EcoEats
//
//  Created by Mathew Chanda on 5/8/21.
//

import SwiftUI

struct TabController: View {
    var body: some View {
        TabView {
            ShopView()
                .tabItem {
                    Label("Shop", systemImage: "cart")
                }
        }.accentColor(.green)
    }
}

struct TabController_Previews: PreviewProvider {
    static var previews: some View {
        TabController()
    }
}
