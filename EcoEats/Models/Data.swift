//
//  Store.swift
//  EcoEats
//
//  Created by Mathew Chanda on 5/8/21.
//

import Foundation
import Combine

class Data : ObservableObject{
    
    
    
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
    private func parseJSONData(_ data: Data) {
//            var response: NewsApiResponse
//            do {
//                response = try JSONDecoder().decode(NewsApiResponse.self, from: data)
//            } catch {
//                print("Error parsing the API response: \(error)")
//                return []
//            }
//
//            if response.status != Constants.APIResponse.statusOK {
//                print("API response status is not OK: \(response.status)")
//                return []
//            }
//
//            return response.articles ?? []
    }
}
