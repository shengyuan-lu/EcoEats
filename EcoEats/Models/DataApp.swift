//
//  Store.swift
//  EcoEats
//
//  Created by Mathew Chanda on 5/8/21.
//

import Foundation
import Combine

class DataApp : ObservableObject{
    
    @Published var store : [Store] = [Store]()
    @Published var cartItems : [Item] = [Item]()
    
    init(){
        startLoadingFromJSON();
    }
    
    /// Load API Response from JSON File
    func startLoadingFromJSON() {
//        guard let jsonData = readJsonFromFile(resourceName: Constants.ResponsePayload.everything) else { return }
//        let mockArticles = parseJSONData(jsonData)
//
//        self.general.append(contentsOf: mockArticles)
//        self.sports.append(contentsOf: mockArticles)
//        self.health.append(contentsOf: mockArticles)
//        self.entertainment.append(contentsOf: mockArticles)
    }
    
    /// Helper Method | Parse JSON Data
    private func parseJSONData()  {

    }
}
