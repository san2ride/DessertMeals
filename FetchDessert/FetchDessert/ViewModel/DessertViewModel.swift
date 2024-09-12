//
//  DessertViewModel.swift
//  FetchDessert
//
//  Created by Jason Sanchez on 8/15/24.
//

import Foundation

class DessertListViewModel: ObservableObject, Identifiable {
    //MARK: When the property changes, publishing occurs. subscribers receive the new value before it’s set on the property.
    @Published var desserts: [DessertViewModel] = []
    
    //MARK: async/await DessertListView
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
    //MARK: async/await DessertDetailsView
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
    private let meal: Meal
    
    init(meal: Meal) {
        self.meal = meal
    }
    
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
    
    //MARK: computed property to get a list of all formatted ingredients
    var formattedIngredients: [String] {
        return (0..<meal.recipe.ingredients.count).compactMap { formattedIngredient(at: $0) }
    }
    
    //MARK: specific ingredient
    func ingredient(at index: Int) -> String? {
        guard index >= 0 && index < meal.recipe.ingredients.count else { return nil }
        return meal.recipe.ingredients[index]
    }

    //MARK: specific measure
    func measure(at index: Int) -> String? {
        guard index >= 0 && index < meal.recipe.measures.count else { return nil }
        return meal.recipe.measures[index]
    }

    //MARK: format an ingredient with its measure
    func formattedIngredient(at index: Int) -> String? {
        guard let ingredient = ingredient(at: index), let measure = measure(at: index), !ingredient.isEmpty else {
            return nil
        }
        return "\(measure)  \(ingredient)"
    }
}
