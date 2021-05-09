//
//  CartView.swift
//  EcoEats
//
//  Created by Shengyuan Lu on 5/9/21.
//

import SwiftUI

struct CartView: View {
    
    @State private var item: Item = Item(icon: "🥤", name: "Juice", percentage: 69, quanity: 1, price: 5.00)
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                
                Text("Your healthy, sustainable foods are waiting!")
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 16)
                
                Divider()
                
                VStack {
                    
                    CartViewCell(item: item)
                        .navigationTitle("My Cart")
                    
                    Divider()
                        .padding(10)
                    
                    Spacer()
                    
                    
                    NavigationLink(
                        destination: CheckoutSuccessView(),
                        label: {
                            Text("Checkout - Total $\(Double(item.price!), specifier: "%.2f")")
                                .font(.title)
                                .fontWeight(.regular)
                                .padding(10)
                                .frame(maxWidth: .infinity)
                                .background(Color.init(hex: "54925A"))
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        })
                        .padding()
                    
                }
                
            }
            
        }
        
        
    }
    
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
