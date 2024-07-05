//
//  TestDataManager.swift
//  RecipeAppTests
//
//  Created by Oscar Berggren on 2024-07-05.
//

import Foundation
@testable import RecipeApp

class TestDataManager {
    func getResultFromFile<T>(filePath path: String) -> T? where T: Codable {
        guard let data = getLocalTestAsset(forPath: path) else { return nil }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601Miliseconds
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            print(error)
            return nil
        }
    }
    
    func getLocalTestAsset(forPath path: String) -> Data? {
        if let path = Bundle(for: TestDataManager.self).path(forResource: path, ofType: ""), let file = FileManager().contents(atPath: path) {
            return file as Data?
        }

        return nil
    }

    var recipeDetailsBananaPancakes: RecipeDetailsResponse {
        getResultFromFile(filePath: "RecipeDetailsBananaPancakes.json")!
    }

    var recipeCategoryDessert: RecipeCategoryResponse {
        getResultFromFile(filePath: "RecipeCategoryDessert.json")!
    }
}
