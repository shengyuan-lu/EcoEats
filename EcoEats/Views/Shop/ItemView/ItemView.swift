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
    var body: some View {
        NavigationView {
            VStack{
                List{
                    HStack{
                        VStack(alignment: .leading, spacing: 10){
                            Text("Items")
                                .bold()
                                .underline()
                                .font(.title)
                            Text("Please select an Item! ")
                                .fontWeight(.thin)
                                .bold()
                        }
                        Spacer()
                        Image("24Hr")
                
                    }
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            Text("Beverages")
                                .bold()
                                .underline()
                                .font(.title2)
                            ScrollView(.horizontal, showsIndicators: true){
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
                                .underline()
                                .font(.title2)
                            ScrollView(.horizontal, showsIndicators: true){
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
                                .underline()
                                .font(.title2)
                            ScrollView(.horizontal, showsIndicators: true){
                                HStack(alignment: .top, spacing: -30){
                                    ForEach(data.stores[storeIndex].hygienes) { item in
                                        ItemCard(item : item)
                                    }
                                }.padding(.horizontal, -50)
                            }
                        }
                        
                        Spacer(minLength: 120)
                }
            }.navigationBarTitle(Text("Items for Sale"))
              .navigationBarItems(trailing:
                            Button(action: {
                            }, label: {
                                    HStack {
                                        Text("Next")
                                        Image(systemName: "arrow.forward.circle.fill")
                                                
                                    }
                                            .padding(10)
                                            .background(Color.init(hex: "54925A"))
                                            .foregroundColor(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            
                            }).padding(.top,88)
                
                )
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        ItemView(storeIndex : 0)
            .environmentObject(DataApp())
    }
}
}
