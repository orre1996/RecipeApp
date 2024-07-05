//
//  ReciepeDetailsViewModelTest.swift
//  RecipeAppTests
//
//  Created by Oscar Berggren on 2024-07-05.
//

import Foundation
@testable import RecipeApp

class RecipesRepositoryTest: RecipeRepositoryProtocol {
    let testDataManager = TestDataManager()

    func getRecipeCategory(category: RecipeApp.RecipeCategory) async -> RecipeApp.RecipeCategoryResponse? {
        return testDataManager.recipeCategoryDessert
    }
    
    func getRecipeDetails(recipeId: String) async -> RecipeApp.RecipeDetailsResponse? {
        return testDataManager.recipeDetailsBananaPancakes
    }
}
