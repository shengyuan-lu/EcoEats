//
//  ItemInfo.swift
//  EcoEats
//
//  Created by Mathew Chanda on 5/9/21.
//

import SwiftUI

struct ItemInfo: View {
    
    @State var item : Item
    @Binding var isPresented : Bool
    @EnvironmentObject var dataApp : DataApp
    
    var body: some View {
        NavigationView  {
            VStack(alignment: .center){
                Image(uiImage: item.icon!.image(size: 200)!)
                
                List{
                    HStack(alignment: .firstTextBaseline){
                        Text("Quantity :")
                            .font(.title2)
                            .fontWeight(.heavy)
                        Spacer()
                        TextField("Quantity", value: $item.quanity, formatter: NumberFormatter())
                            .font(.title2)
                        
                    }
                    
                    HStack(alignment: .firstTextBaseline){
                        Text("Price Per Item:")
                            .font(.title2)
                            .fontWeight(.heavy)
                        Text("$\(Double(item.price!), specifier: "%.2f")")
                            .font(.title2)
                    }
                    
                    HStack{
                        Button(action: {
                            isPresented = false;
                        }, label: {
                            HStack {
                                Text("Cancel")
                                Image(systemName: "xmark.circle.fill")
                                
                            }
                            .padding(10)
                            .background(Color.init(hex: "CC0000"))
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                        })
                        Spacer()
                        Button(action: {
                            dataApp.cartItems.append(item)
                            print("\(dataApp.cartItems)")
                            isPresented = false;
                        }, label: {
                            HStack {
                                Text("Add to Cart")
                                Image(systemName: "cart.badge.plus")
                                
                            }
                            .padding(10)
                            .background(Color.init(hex: "54925A"))
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                        })
                    }
                }
            }.navigationBarTitle(Text("\(item.name!)"))
            .hasScrollEnabled(false)
            
        }
    }
}

struct ItemInfo_Previews: PreviewProvider {
    @State static var isPresent : Bool = false
    static var previews: some View {
        
        ItemInfo(item: DataApp().stores[0].beverages[0], isPresented: $isPresent)
            .environmentObject(DataApp())
    }
}

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension View {
    func hasScrollEnabled(_ value: Bool) -> some View {
        self.onAppear {
            UITableView.appearance().isScrollEnabled = value
        }
    }
}
