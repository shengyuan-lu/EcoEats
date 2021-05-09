//
//  ItemView.swift
//  EcoEats
//
//  Created by Mathew Chanda on 5/8/21.
//

import SwiftUI

struct ItemView: View {
    @State var storeIndex : Int = 0
    @EnvironmentObject var data : DataApp
    
    @Binding var storeName: String
    @Binding var storeImageName: String
    
    var body: some View {
        
        VStack{
            
            ScrollView(showsIndicators: false) {
                
                
                VStack {
                    
                    Image(storeImageName)
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    Text("\(storeName)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.init(hex: "54925A"))
                        .lineLimit(2)
                    
                }
                
                Divider()
                

                VStack(alignment: .leading) {
                    VStack(alignment: .leading){
                        Text("Beverages")
                            .bold()
                            .font(.title2)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(alignment: .top, spacing: -30){
                                ForEach(data.stores[storeIndex].beverages) { item in
                                    ItemCard(item : item)
                                }
                            }.padding(.horizontal, -50)
                        }
                    }
                    
                    Spacer(minLength: 30)
                    
                    VStack(alignment: .leading){
                        Text("Vegetables")
                            .bold()
                            .font(.title2)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(alignment: .top, spacing: -30){
                                ForEach(data.stores[storeIndex].veggies) { item in
                                    ItemCard(item : item)
                                }
                            }.padding(.horizontal, -50)
                        }
                    }
                    
                    Spacer(minLength: 30)
                    
                    VStack(alignment: .leading){
                        Text("Hygienie")
                            .bold()
                            .font(.title2)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(alignment: .top, spacing: -30){
                                ForEach(data.stores[storeIndex].hygienes) { item in
                                    ItemCard(item : item)
                                }
                            }.padding(.horizontal, -50)
                        }
                    }
                    Spacer(minLength: 70)
                }
            }
            .listRowBackground(Color.clear)
            .background(Color.clear)
            .navigationBarTitle(Text("Items for Sale"))
            .navigationBarItems(trailing:
                                    Button(action: {
                                    }, label: {
                                        NavigationLink(destination: CheckoutSuccessView()){
                                            HStack {
                                                Text("Next")
                                                Image(systemName: "arrow.forward.circle.fill")
                                                
                                            }
                                            .padding(10)
                                            .background(Color.init(hex: "54925A"))
                                            .foregroundColor(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        }
                                        
                                    }).padding(.top,88)
                                
            )
            
        }
        
    }
    
    struct ItemView_Previews: PreviewProvider {
        
        static var previews: some View {
            ItemView(storeIndex: 0, storeName: .constant("FreshMart"), storeImageName: .constant("FreshMart"))
                .environmentObject(DataApp())
        }
    }
}
