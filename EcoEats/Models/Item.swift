//
//  Item.swift
//  EcoEats
//
//  Created by Mathew Chanda on 5/8/21.
//

import Foundation
struct Item : Codable,Identifiable {
    let id = UUID()
    var icon : String?
    var name : String?
    var percentage : Int?
    var quanity : Int?
    var price : Double?
}
