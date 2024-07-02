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

                Text(ingredient ?? String.emptyString(length: 40))
                    .foregroundStyle(Color.cardTextColor)
                    .font(.body(size: 16))
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
