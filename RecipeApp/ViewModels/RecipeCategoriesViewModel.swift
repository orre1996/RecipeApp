//
//  RecipeCategoriesViewModel.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import Foundation

@MainActor
class RecipeCategoriesViewModel: ObservableObject {
    let recipeRepository: RecipeRepository

    @Published var recipes: [Meal]?
    @Published var showRecipeCategoryError = false
    @Published var sortOption = RecipeCategorySortOption.alphabetic

    init(recipeRepository: RecipeRepository = RecipeRepository.shared) {
        self.recipeRepository = recipeRepository
    }

    func getRecipeCategory(_ category: RecipeCategory) async {
        guard recipes == nil else { return }

        if let recipeCategory = await recipeRepository.getRecipeCategory(category: category) {
            sortRecipes(recipes: recipeCategory.meals)
        } else {
            showRecipeCategoryError = true
        }
    }

    private func sortRecipes(recipes: [Meal]) {
        switch sortOption {
            case .alphabetic:
                self.recipes = recipes.sorted(by: { $0.strMeal < $1.strMeal })
        }
    }
}
