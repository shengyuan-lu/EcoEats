//
//  ContentView.swift
//  EcoEats
//
//  Created by Shengyuan Lu on 5/8/21.
//

import SwiftUI

struct MainView: View {
  
    var data : DataApp = DataApp()
    
    @AppStorage("isLoggedin") var isLoggedin: Bool = false
    
    @State var selectedTabIndex: Int = 0
    
    var body: some View {
        
        if isLoggedin {
            MainAppView(isLoggedin: $isLoggedin)
                .onChange(of: isLoggedin, perform: { value in
                    self.selectedTabIndex = 3
                })
            
        } else {
            IntroductionView(selectedTab: $selectedTabIndex, isLoggedin: $isLoggedin)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(selectedTabIndex: 0)
    }
}
