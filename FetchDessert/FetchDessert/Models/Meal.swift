//
//  Meal.swift
//  FetchDessert
//
//  Created by Jason Sanchez on 8/15/24.
//

import Foundation

struct MealResponse: Codable {
    let meals: [Meal]
}

struct Meal: Codable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String?
    let strMealThumb: String
    let recipe: Recipe
    
    enum CodingKeys: String, CodingKey {
        case idMeal
        case strMeal
        case strInstructions
        case strMealThumb
        case recipe
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        idMeal = try container.decode(String.self, forKey: .idMeal)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strInstructions = try container.decodeIfPresent(String.self, forKey: .strInstructions)
        strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        recipe = try Recipe(from: decoder) //MARK: decode Recipe using the same decoder
    }
}

struct Recipe: Codable {
    let ingredients: [String]
    let measures: [String]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RecipeCodingKeys.self)
        
        //MARK: decode ingredients dynamically
        ingredients = (1...20).compactMap { index in
            guard let key = RecipeCodingKeys(stringValue: "strIngredient\(index)"),
                  let value = try? container.decodeIfPresent(String.self, forKey: key),
                  !(value.isEmpty) else {
                return nil
            }
            return value
        }
        
        //MARK: decode measures dynamically
        measures = (1...20).compactMap { index in
            guard let key = RecipeCodingKeys(stringValue: "strMeasure\(index)"),
                  let value = try? container.decodeIfPresent(String.self, forKey: key),
                  !(value.isEmpty) else {
                return nil
            }
            return value
        }
    }
}

struct RecipeCodingKeys: CodingKey {
    var stringValue: String
    var intValue: Int?
    
    init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }
    
    init?(intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }
}
