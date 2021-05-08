//
//  Store.swift
//  EcoEats
//
//  Created by Mathew Chanda on 5/8/21.
//

import Foundation
class Store : Decodable  {
    var name : String?
    var time : String?
    var distances : Double?
    var beverages : [Item] = [Item]()
    var veggies : [Item] = [Item]()
    var hygienes : [Item] = [Item]()
}
