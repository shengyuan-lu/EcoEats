//
//  PromoView.swift
//  EcoEats
//
//  Created by Shengyuan Lu on 5/8/21.
//

import SwiftUI

struct PromoView: View {
    
    @Binding var isLoggedin: Bool
    
    @Binding var tabSelection: Int
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                VStack(alignment: .leading) {
                    
                    Text("Your journey with EcoEat starts here.")
                        .foregroundColor(.secondary)

                    Divider()
                        .padding(.vertical, 10)
                    
                    VStack(alignment: .leading) {
                        
                        Text("Shop Safe")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.init(hex: "54925A"))
                        
                        
                        Text("Make your order online and we'll prepare it. Then you can come and pick it up contactlessly.")
                            .foregroundColor(.secondary)
                            .padding(.vertical, 10)
                        
                        ZStack {
                            Color.init(hex: "EDFFF3")
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                            
                            Image("shopsafe")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        
                        Button(action: {
                            
                            self.tabSelection = 1
                            
                        }, label: {
                            
                            Text("Shop Now")
                                .font(.title2)
                                .fontWeight(.regular)
                                .padding(10)
                                .frame(maxWidth: .infinity)
                                .background(Color.init(hex: "54925A"))
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))

                        })
                        .padding(.vertical)
                    }
                    
                    Divider()
                        .padding(.vertical)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("Purchase Sustainable Foods")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.init(hex: "54925A"))
                        
                        
                        Text("Support locally sourced foods that are both good for you and for the environement.")
                            .foregroundColor(.secondary)
                            .padding(.vertical, 10)
                        
                        ZStack {
                            Color.init(hex: "EDFFF3")
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                            
                            Image("shoponline")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        
                        Button(action: {
                            
                            self.tabSelection = 1
                            
                            
                        }, label: {
                            
                            Text("Find Sustainable Options")
                                .font(.title2)
                                .fontWeight(.regular)
                                .padding(10)
                                .frame(maxWidth: .infinity)
                                .background(Color.init(hex: "54925A"))
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))

                        })
                        .padding(.vertical)

                    }
                    
                    Divider()
                        .padding(.vertical)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("Register Your Store")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.init(hex: "54925A"))
                        
                        
                        Text("If you're a market that's offering contactless shopping, register here!")
                            .foregroundColor(.secondary)
                            .padding(.vertical, 10)
                        
                        ZStack {
                            Color.init(hex: "EDFFF3")
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                            
                            Image("regshop")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        
                        Button(action: {
                            
                            self.tabSelection = 1
                            
                            
                        }, label: {
                            
                            Text("Register Now")
                                .font(.title2)
                                .fontWeight(.regular)
                                .padding(10)
                                .frame(maxWidth: .infinity)
                                .background(Color.init(hex: "54925A"))
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))

                        })
                        .padding(.vertical)

                    }
                    
                }
                .padding(.horizontal, 16)
                
            }
            .navigationBarTitle(Text("Overview"))
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




struct PromoView_Previews: PreviewProvider {
    static var previews: some View {
        PromoView(isLoggedin: .constant(true), tabSelection: .constant(0))
    }
}
