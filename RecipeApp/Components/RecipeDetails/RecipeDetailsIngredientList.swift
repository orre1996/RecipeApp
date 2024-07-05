//
//  RecipeDetailsIngredientList.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import SwiftUI

struct RecipeDetailsIngredientList: View {
    let ingredients: [String]?

    var body: some View {
        LazyVStack(alignment: .leading, spacing: 16) {
            ForEach(0..<(ingredients?.count ?? 10), id: \.self) { index in
                let ingredient = ingredients?[safe: index]

                ShimmeringText(text: ingredient ?? String.emptyString(length: 40),
                               font: .body(size: 16),
                               color: Color.cardTextColor,
                               downloading: ingredient == nil)
                .padding(.horizontal, 16)
                .accessibilityLabel("Ingredient \(index + 1) out of \(ingredients?.count ?? 0). \(ingredient ?? "")")

                if ingredient != ingredients?.last {
                    Divider()
                }
            }
        }
        .padding(.vertical, 16)
        .cardBackground()
    }
}

#Preview {
    RecipeDetailsIngredientList(ingredients: [])
}
