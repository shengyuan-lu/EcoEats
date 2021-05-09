//
//  ShopView.swift
//  EcoEats
//
//  Created by Mathew Chanda on 5/8/21.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        NavigationView {
            VStack{
                List{
                    HStack{
                        VStack(alignment: .leading, spacing: 10){
                            Text("Find a Store")
                                .bold()
                                .underline()
                            Text("Enter your zipcode to find store near you!")
                                .fontWeight(.thin)
                                .bold()
                        }
                        Image("24Hr")
                    }
                    
                }
            }.navigationBarTitle(Text("Nearest Store"))
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
