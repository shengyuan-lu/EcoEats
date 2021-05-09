//
//  ItemCard.swift
//  EcoEats
//
//  Created by Mathew Chanda on 5/9/21.
//

import SwiftUI

struct ItemCard: View {
    @State var item : Item
    @State var showingSheet : Bool = false;
    
    var body: some View {
        Button(action: {showingSheet = true}, label: {
            
            VStack(alignment: .center) {
                
                Image(uiImage: item.icon!.image(size: 60)!)
                    .clipped()
                    .shadow(color: Color.black, radius: 5, x: 0, y: 0)
                
                Text(item.name!)
                    .bold()
                    .lineLimit(5)
                    .font(.subheadline)
                    .foregroundColor(.primary)
            }
            .frame(width: 155)
            .padding(.leading, 15)
            .sheet(isPresented: $showingSheet, content: {
                ItemInfo(item: item, isPresented: $showingSheet)
            })
        })
    }
}

struct ItemCard_Previews: PreviewProvider {
    static var previews: some View {
        ItemCard(item: DataApp().stores[0].beverages[0])
    }
}

extension String {
    
    func image(size : Int) -> UIImage? {
        let nsString = (self as NSString)
        let font = UIFont.systemFont(ofSize: CGFloat(size)) // you can change your font size here
                let stringAttributes = [NSAttributedString.Key.font: font]
                let imageSize = nsString.size(withAttributes: stringAttributes)

                UIGraphicsBeginImageContextWithOptions(imageSize, false, 0) //  begin image context
                UIColor.clear.set() // clear background
                UIRectFill(CGRect(origin: CGPoint(), size: imageSize)) // set rect size
                nsString.draw(at: CGPoint.zero, withAttributes: stringAttributes) // draw text within rect
                let image = UIGraphicsGetImageFromCurrentImageContext() // create image from context
                UIGraphicsEndImageContext() //  end image context
    
                return image ?? UIImage()
    }
}
