//
//  RecipeRepositoryProtocol.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-05.
//

import Foundation

protocol RecipeRepositoryProtocol {
    func getRecipeCategory(category: RecipeCategory) async -> RecipeCategoryResponse?
    func getRecipeDetails(recipeId: String) async -> RecipeDetailsResponse?
}
