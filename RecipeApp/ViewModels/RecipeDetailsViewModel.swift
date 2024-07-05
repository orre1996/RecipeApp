//
//  RecipeDetailsViewModel.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import Foundation

@MainActor
class RecipeDetailsViewModel: ObservableObject {
    private let recipeRepository: RecipeRepositoryProtocol

    @Published var recipeDetails: RecipeDetails
    @Published var showRecipeDetailsError = false
    
    init(recipeRepository: RecipeRepositoryProtocol = RecipeRepository.shared, meal: Meal) {
        self.recipeRepository = recipeRepository
        self.recipeDetails = meal.toRecipeDetails()
    }

    func getRecipeDetails() async {
        showRecipeDetailsError = false

        if let recipeDetails = await recipeRepository.getRecipeDetails(recipeId: recipeDetails.idMeal)?.meals.first {
            self.recipeDetails = recipeDetails
        } else {
            showRecipeDetailsError = true
        }
    }
}
