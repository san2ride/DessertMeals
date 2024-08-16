//
//  DessertViewModel.swift
//  FetchDessert
//
//  Created by Jason Sanchez on 8/15/24.
//

import Foundation

class DessertListViewModel: ObservableObject, Identifiable {
    @Published var desserts: [DessertViewModel] = []
    
    func getDesserts() async {
        do {
            let desserts = try await WebService().fetchDesserts(url: Urls.desserts)
            DispatchQueue.main.async {
                self.desserts = desserts.map(DessertViewModel.init)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getDessertDetails(mealId: String) async {
        do {
            let desserts = try await WebService().fetchDessertDetailsAsync(mealId: mealId, url: Urls.dessertMealDetails(by: mealId))
            DispatchQueue.main.async {
                self.desserts = desserts.map(DessertViewModel.init)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct DessertViewModel {
    fileprivate var meal: Meal
    
    var strMeal: String {
        meal.strMeal
    }
    
    var strMealThumb: URL? {
       URL(string: meal.strMealThumb)
    }
    
    var idMeal: String {
        meal.idMeal
    }
    
    var strInstructions: String {
        meal.strInstructions ?? ""
    }
    
    var strIngredient1: String {
        meal.strIngredient1 ?? ""
    }
    
    var strIngredient2: String {
        meal.strIngredient2 ?? ""
    }
    
    var strIngredient3: String {
        meal.strIngredient3 ?? ""
    }
    
    var strIngredient4: String {
        meal.strIngredient4 ?? ""
    }
    
    var strIngredient5: String {
        meal.strIngredient5 ?? ""
    }
    
    var strIngredient6: String {
        meal.strIngredient6 ?? ""
    }
    
    var strIngredient7: String {
        meal.strIngredient7 ?? ""
    }
    
    var strIngredient8: String {
        meal.strIngredient8 ?? ""
    }
    
    var strIngredient9: String {
        meal.strIngredient9 ?? ""
    }
    
    var strIngredient10: String {
        meal.strIngredient10 ?? ""
    }
    
    var strIngredient11: String {
        meal.strIngredient11 ?? ""
    }
    
    var strIngredient12: String {
        meal.strIngredient12 ?? ""
    }
    
    var strIngredient13: String {
        meal.strIngredient13 ?? ""
    }
    
    var strIngredient14: String {
        meal.strIngredient14 ?? ""
    }
    
    var strIngredient15: String {
        meal.strIngredient15 ?? ""
    }
    
    var strIngredient16: String {
        meal.strIngredient16 ?? ""
    }
    
    var strIngredient17: String {
        meal.strIngredient17 ?? ""
    }
    
    var strIngredient18: String {
        meal.strIngredient18 ?? ""
    }
    
    var strIngredient19: String {
        meal.strIngredient19 ?? ""
    }
    
    var strIngredient20: String {
        meal.strIngredient20 ?? ""
    }
    
    var strMeasure1: String {
        meal.strIngredient1 ?? ""
    }
    
    var strMeasure2: String {
        meal.strMeasure2 ?? ""
    }
    
    var strMeasure3: String {
        meal.strMeasure3 ?? ""
    }
    
    var strMeasure4: String {
        meal.strMeasure4 ?? ""
    }
    
    var strMeasure5: String {
        meal.strMeasure5 ?? ""
    }
    
    var strMeasure6: String {
        meal.strMeasure6 ?? ""
    }
    
    var strMeasure7: String {
        meal.strMeasure7 ?? ""
    }
    
    var strMeasure8: String {
        meal.strMeasure8 ?? ""
    }
    
    var strMeasure9: String {
        meal.strMeasure9 ?? ""
    }
    
    var strMeasure10: String {
        meal.strMeasure10 ?? ""
    }
    
    var strMeasure11: String {
        meal.strMeasure11 ?? ""
    }
    
    var strMeasure12: String {
        meal.strMeasure12 ?? ""
    }
    
    var strMeasure13: String {
        meal.strMeasure13 ?? ""
    }
    
    var strMeasure14: String {
        meal.strMeasure14 ?? ""
    }
    
    var strMeasure15: String {
        meal.strMeasure15 ?? ""
    }
    
    var strMeasure16: String {
        meal.strMeasure16 ?? ""
    }
    
    var strMeasure17: String {
        meal.strMeasure17 ?? ""
    }
    
    var strMeasure18: String {
        meal.strMeasure18 ?? ""
    }
    
    var strMeasure19: String {
        meal.strMeasure19 ?? ""
    }
    
    var strMeasure20: String {
        meal.strMeasure20 ?? ""
    }
}
/*
//MARK: Work In Progress
// Computed property to get a specific ingredient
func ingredient(at index: Int) -> String? {
    guard index >= 0 && index < meal.ingredients.count else { return nil }
    return meal.ingredients[index]
}

// Computed property to get a specific measure
func measure(at index: Int) -> String? {
    guard index >= 0 && index < meal.measures.count else { return nil }
    return meal.measures[index]
}

// Computed property to format an ingredient with its measure
func formattedIngredient(at index: Int) -> String? {
    guard let ingredient = ingredient(at: index), let measure = measure(at: index), !ingredient.isEmpty else {
        return nil
    }
    return "\(measure) \(ingredient)"
}

// Example: Computed property to get a list of all formatted ingredients
var formattedIngredients: [String] {
    return (0..<meal.ingredients.count).compactMap { formattedIngredient(at: $0) }
}
 */
