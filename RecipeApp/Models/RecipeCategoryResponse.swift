//
//  Models.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import Foundation

struct RecipeCategoryResponse: Codable {
    let meals: [Meal]
}

struct Meal: Codable, Hashable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
    
    static func emptyMeal() -> Meal {
        return Meal(strMeal: "", strMealThumb: "", idMeal: "")
    }
    
    func toRecipeDetails() -> RecipeDetails {
        return RecipeDetails(idMeal: idMeal,
                             strMeal: strMeal,
                             strDrinkAlternate: nil,
                             strCategory: "",
                             strArea: "",
                             strInstructions: "",
                             strMealThumb: strMealThumb,
                             strTags: nil,
                             strYoutube: "",
                             strSource: "",
                             strImageSource: nil,
                             strCreativeCommonsConfirmed: nil,
                             dateModified: nil,
                             ingredients: [])
    }
}
