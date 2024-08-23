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
    
    func fetchDessertDetailsAsync(mealId: String, url: URL?) async throws -> [Meal] {
        try await withCheckedThrowingContinuation { continuation in
            fetchDessertDetails(mealId: mealId, url: url) { result in
                switch result {
                    case .success(let desserts):
                        continuation.resume(returning: desserts)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func fetchDessertDetails(mealId: String, url: URL?, completion: @escaping (Result<([Meal]), NetworkError>) -> Void) {
        guard let url = url else {
            completion(.failure(.badUrl))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            let mealResponse = try? JSONDecoder().decode(MealResponse.self, from: data)
            completion(.success(mealResponse?.meals ?? []))
        }.resume()
    }
}
