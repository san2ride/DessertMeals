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
                print(desserts)
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
    
    var strMeasure1: String {
        meal.strMeasure1 ?? ""
    }
}
