//
//  CartView.swift
//  EcoEats
//
//  Created by Shengyuan Lu on 5/9/21.
//

import SwiftUI

struct CartCellCell: View {
    
    @State var item: Item
    
    let cornerRadius: CGFloat = 10
    let gReaderHeight: CGFloat = 100
    
    var body: some View {
        
        GeometryReader(content: { geometry in
            
            ZStack {
                
                HStack {
                    
                    Image(uiImage: item.icon!.image(size: 60)!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width/3 - 20, height: geometry.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    
                    VStack(alignment: .leading) {
                        
                        Text(item.name!)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .lineLimit(2)
                        
                        Text("You reduced your carbon footprint by \(item.percentage!)%")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        
                        Spacer()
                        
                        HStack(alignment: .bottom) {
                            
                            Text("$\(Double(item.price!), specifier: "%.2f")")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                                .lineLimit(2)
                            
                            Spacer()
                            
                            Text("Quantity: \(item.quanity!)")
                                .fontWeight(.bold)
                                .font(.body)
                                .foregroundColor(.secondary)
                                .lineLimit(3)
                        }

                        
                        

                    }
                    .padding(.leading, 10)
                }
                .cornerRadius(cornerRadius)
                
            }
            
        })
        .frame(height: gReaderHeight)
        .padding(5)
    }

}

struct CartCellCell_Previews: PreviewProvider {
    static var previews: some View {
        CartCellCell(item: Item(icon: "🥤", name: "Juice", percentage: 69, quanity: 1, price: 5.00))
    }
}
