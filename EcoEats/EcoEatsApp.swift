//
//  EcoEatsApp.swift
//  EcoEats
//
//  Created by Shengyuan Lu on 5/8/21.
//

import SwiftUI

@main
struct EcoEatsApp: App {
    @StateObject var data : DataApp = DataApp()
    var body: some Scene {
        WindowGroup {
            ItemView()
                .environmentObject(data)
        }
    }
}
