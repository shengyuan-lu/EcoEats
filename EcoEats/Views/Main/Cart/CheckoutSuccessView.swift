//
//  CheckoutSuccessView.swift
//  EcoEats
//
//  Created by Shengyuan Lu on 5/9/21.
//

import SwiftUI

struct CheckoutSuccessView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                Text("Your item(s) will be delievered in 2 Days.")
                    .foregroundColor(.secondary)
                
                Divider()
                    .padding(.vertical, 10)
                
                VStack(alignment: .center) {
                    
                    ZStack {
                        Color.init(hex: "EDFFF3")
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                        
                        Image("checkout")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    
                    VStack(alignment: .center) {
                        Text("Your order has been successfully placed!")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.init(hex: "54925A"))
                        
                        
                        Text("Thanks for changing the world one order at a time.")
                            .foregroundColor(.secondary)
                            .padding(.vertical, 10)
                    }
                    
                }
                
                Divider()
                    .padding(.vertical, 10)
                
                Button(action: {
                    
                }, label: {
                    
                    Text("Take a Survey and Earn $$")
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
            .padding(.horizontal, 16)
            
        }
        .navigationBarTitle(Text("Checkout Success"))
        .navigationBarTitleDisplayMode(.large)
        .navigationBarItems(trailing:
                                
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                    
                                }, label: {
                                    
                                    Image(systemName: "multiply.circle.fill")
                                        .font(.title)
                                        .foregroundColor(Color.init(hex: "54925A"))
                                    
                                })
        )
        
        
        
    }
}




struct CheckoutSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutSuccessView()
    }
}

