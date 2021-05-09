//
//  ItemCard.swift
//  EcoEats
//
//  Created by Mathew Chanda on 5/9/21.
//

import SwiftUI

struct ItemCard: View {
    @State var item : Item
    var body: some View {
        VStack(alignment: .center) {
            Image(uiImage: item.icon!.image()!)
                .clipped()
                .shadow(color: Color.gray, radius: 10, x: 0, y: 0)
            Text(item.name!)
                .bold()
                .lineLimit(5)
                .font(.subheadline)
                .foregroundColor(.black)
        }
        .frame(width: 155)
        .padding(.leading, 15)
        
    }
}

struct ItemCard_Previews: PreviewProvider {
    static var previews: some View {
        ItemCard(item: DataApp().stores[0].beverages[0])
    }
}

extension String {
    func image() -> UIImage? {
        let nsString = (self as NSString)
                let font = UIFont.systemFont(ofSize: 60) // you can change your font size here
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
