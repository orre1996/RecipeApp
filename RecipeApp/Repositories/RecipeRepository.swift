//
//  RecipeRepository.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import Foundation

class RecipeRepository {
    static let shared = RecipeRepository()

    let networkManager: NetworkManager

    init(networkManager: NetworkManager = NetworkManager.shared) {
        self.networkManager = networkManager
    }

    func getRecipeCategory(category: RecipeCategory) async -> RecipeCategoryResponse? {
        let categoryResult: Result<RecipeCategoryResponse, Error> = await networkManager.get(endpoint: .recipeCategory(category: category))

        switch categoryResult {
            case .success(let category):
                return category

            case .failure(let error):
                print("Failed downloading recipe category: \(category), error: \(error)")
                return nil
        }
    }

    func getRecipeDetails(recipeId: String) async -> RecipeDetailsResponse? {
        let detailResult: Result<RecipeDetailsResponse, Error> = await networkManager.get(endpoint: .recipeDetails(recipeId: recipeId))

        switch detailResult {
            case .success(let recipeDetails):
                return recipeDetails

            case .failure(let error):
                print("Failed downloading recipe details with id: \(recipeId), error: \(error)")
                return nil
        }
    }
}
