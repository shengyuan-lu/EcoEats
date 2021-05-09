//
//  ProfileView.swift
//  EcoEats
//
//  Created by Shengyuan Lu on 5/9/21.
//

import SwiftUI
import SwiftUICharts

struct ProfileView: View {
    
    @Binding var isLoggedin: Bool
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                VStack {
                    VStack(spacing: 10) {
                        
                        Image("shengyuan")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.init(hex: "54925A"), lineWidth: 5))
                        
                        
                        Text("Shengyuan")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.init(hex: "54925A"))
                            .lineLimit(2)
                        
                        
                        LineView(data: [8,23,54,32,12,37,7,23,43], title: "My Carbon Footprint", legend: "Weekly / (CO2e)", style: ChartStyle(backgroundColor: Color.white, accentColor: Color.init(hex: "54925A"), gradientColor: GradientColor(start: Color.init(hex: "54925A"), end: Color.init(hex: "54925A")), textColor: Color.primary, legendTextColor: Color.init(hex: "54925A"), dropShadowColor: Color.black), valueSpecifier:  "%.0f")
                            .padding(16)
                        
                        
                    }
                    

            }
            

                
            }
            .navigationBarTitle(Text("Profile"))
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
