//
//  Constants.swift
//  FetchDessert
//
//  Created by Jason Sanchez on 8/15/24.
//

import Foundation

struct Urls {
    
    static let desserts: URL? = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
    
    static func dessertMealDetails(by mealID: String) -> URL? {
        return URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)")
    }
}
