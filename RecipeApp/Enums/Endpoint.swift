//
//  Endpoint.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import Foundation

enum Endpoint {
    case recipeCategory(category: RecipeCategory)
    case recipeDetails(recipeId: String)
    
    private var baseUrl: String {
        switch self {
            case .recipeCategory(_), .recipeDetails(_):
                return "https://themealdb.com/api/json/v1/1/"
        }
    }

    var path: String {
        switch self {
            case .recipeCategory(let category):
                return "\(baseUrl)filter.php?c=\(category)"

            case .recipeDetails(let recipeId):
                return "\(baseUrl)lookup.php?i=\(recipeId)"
        }
    }
}
