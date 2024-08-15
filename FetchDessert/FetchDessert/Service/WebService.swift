//
//  WebService.swift
//  FetchDessert
//
//  Created by Jason Sanchez on 8/15/24.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidData
    case decodingError
}

class WebService {
    func fetchDesserts(url: URL?) async throws -> [Meal] {
        guard let url = url else {
            return []
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let mealResponse = try? JSONDecoder().decode(MealResponse.self, from: data)
        
        return mealResponse?.meals ?? []
    }
}
