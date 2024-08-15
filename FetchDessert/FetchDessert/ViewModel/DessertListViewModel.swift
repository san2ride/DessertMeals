//
//  DessertListViewModel.swift
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
}

struct DessertViewModel {
    fileprivate var meal: Meal
    
    init(meal: Meal) {
        self.meal = meal
    }
    
    var strMeal: String {
        return meal.strMeal
    }
    
    var strMealThumb: URL? {
       return URL(string: meal.strMealThumb)
    }
    
    var idMeal: String {
        return meal.idMeal
    }
}
