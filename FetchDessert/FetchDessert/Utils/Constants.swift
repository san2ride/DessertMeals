//
//  Constants.swift
//  FetchDessert
//
//  Created by Jason Sanchez on 8/15/24.
//

import Foundation

struct Titles {
    static let dessertListTitle = "Dessert List"
    static let ingredientsTitle = "Ingredients"
    static let recipeTitle = "Recipe"
}

struct Urls {
    static let desserts: URL? = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
    
    static func dessertMealDetails(by dessert: String) -> URL? {
        return URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(dessert)")
    }
}
