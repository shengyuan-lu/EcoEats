//
//  Store.swift
//  EcoEats
//
//  Created by Mathew Chanda on 5/8/21.
//

import Foundation
import Combine
import SwiftyJSON

class DataApp : ObservableObject {
    
    @Published var stores : [Store] = []
    @Published var cartItems : [Item] = []
    
    init() {
        loadJson()
    }
    
    func loadJson(){
        if let url = Bundle.main.url(forAuxiliaryExecutable: "content.json") {
            do {
                let data = try Data(contentsOf: url)
                let results = try JSON(data: data)
                
                // looping through all stores
                for (index, result) in results["stores"]{
                    var store = Store()
                    store.name = result["name"].stringValue
                    store.time = result["time"].stringValue
                    store.distances = result["distances"].doubleValue
                    
                    
                    for (index,beverage) in result["beverages"]{
                        var item = Item();
                        item.name = beverage["name"].stringValue
                        item.icon = beverage["icon"].stringValue
                        item.percentage = beverage["percentage"].intValue
                        item.quanity = beverage["quantity"].intValue
                        
                        store.beverages.append(item);
                    }
                    
                    for (index,veggie) in result["veggies"]{
                        var item = Item();
                        item.name = veggie["name"].stringValue
                        item.icon = veggie["icon"].stringValue
                        item.percentage = veggie["percentage"].intValue
                        item.quanity = veggie["quantity"].intValue
                        
                        store.veggies.append(item);
                    }
                    
                    for (index,hygiene) in result["hygienes"]{
                        var item = Item();
                        item.name = hygiene["name"].stringValue
                        item.icon = hygiene["icon"].stringValue
                        item.percentage = hygiene["percentage"].intValue
                        item.quanity = hygiene["quantity"].intValue
                        
                        store.hygienes.append(item);
                    }
                    
                    print("\(store)")
                    stores.append(store)
                }
                    
                print("\(stores)")
            }
            
            
            catch {
                print("error:\(error)")
            }
        }
    }
}
