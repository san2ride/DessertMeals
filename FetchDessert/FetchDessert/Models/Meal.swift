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
    
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
}

/*
//MARK: Work In Progress
let ingredients: [String?]
let measures: [String?]

enum CodingKeys: String, CodingKey {
    case idMeal, strMeal, strInstructions, strMealThumb
    case ingredients = "ingredients"
    case measures = "measures"
}

 init(from decoder: Decoder) throws {
 let container = try decoder.container(keyedBy: CodingKeys.self)
 
 idMeal = try container.decode(String.self, forKey: .idMeal)
 strMeal = try container.decode(String.self, forKey: .strMeal)
 strInstructions = try container.decode(String.self, forKey: .strInstructions)
 strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
 
 ingredients = (1...20).compactMap { index in
 try? container.decodeIfPresent(String.self, forKey: CodingKeys(stringValue: "strIngredient\(index)")!)
 }
 
 measures = (1...20).compactMap { index in
 try? container.decodeIfPresent(String.self, forKey: CodingKeys(stringValue: "strMeasure\(index)")!)
 }
 }
 */
