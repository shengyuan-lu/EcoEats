//
//  ProfileView.swift
//  EcoEats
//
//  Created by Shengyuan Lu on 5/9/21.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var isLoggedin: Bool
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .navigationBarTitle(Text("Welcome, Shengyuan"))
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(trailing:
                                    
                                    Button(action: {
                                        
                                        self.isLoggedin = false
                                        
                                    }, label: {
                                        
                                        HStack {
                                            Text("Logout")
                                            Image(systemName: "arrow.forward.circle.fill")
                                
                                        }
                                        .padding(10)
                                        .foregroundColor(Color.init(hex: "54925A"))
                                        
                                    })
            )

        }

        
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isLoggedin: .constant(true))
    }
}
