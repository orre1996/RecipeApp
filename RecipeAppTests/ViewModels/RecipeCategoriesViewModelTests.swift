//
//  RecipeCategoriesViewModelTests.swift
//  RecipeAppTests
//
//  Created by Oscar Berggren on 2024-07-05.
//

import Foundation
@testable import RecipeApp
import XCTest

@MainActor
final class RecipeCategoriesViewModelTests: XCTestCase {
    let viewModel = RecipeCategoriesViewModel(recipeRepository: RecipesRepositoryTest())

    func testRecipeCategorySort() async {
        await viewModel.getRecipeCategory(.dessert)

        XCTAssertEqual(viewModel.recipes?.count, 65)
        XCTAssertEqual(viewModel.recipes?.first?.strMeal, "Apam balik")
        XCTAssertEqual(viewModel.recipes?[31].strMeal, "Key Lime Pie")
        XCTAssertEqual(viewModel.recipes?.last?.strMeal, "White chocolate creme brulee")
    }
}
