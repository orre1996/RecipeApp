//
//  RecipeAppTests.swift
//  RecipeAppTests
//
//  Created by Oscar Berggren on 2024-07-05.
//

import XCTest
@testable import RecipeApp

@MainActor
final class RecipeDetailsViewModelTests: XCTestCase {
    let viewModel = RecipeDetailsViewModel(recipeRepository: RecipesRepositoryTest(), meal: Meal.emptyMeal())

    func testRecipeDetailsIngredients() async {
        await viewModel.getRecipeDetails()
    
        XCTAssertEqual(viewModel.recipeDetails.ingredients?.count, 7)
        XCTAssertEqual(viewModel.recipeDetails.ingredients?.first, "1 large Banana")
    }
}
