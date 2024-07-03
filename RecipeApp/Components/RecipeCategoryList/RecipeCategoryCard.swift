//
//  RecipeCategoryCard.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import SwiftUI

struct RecipeCategoryCard: View {
    let meal: Meal?
    let recipePressed: (_ meal: Meal) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ShimmeringImage(imageUrl: meal?.strMealThumb, scaledToFit: false)
                .frame(height: 160)
                .clipped()
                .cornerRadius(radius: 8, corners: [.topLeft, .topRight])

            ShimmeringText(text: meal?.strMeal.capitalized ?? String.emptyString(length: 50),
                           font: .header(size: 16),
                           color: .cardTextColor,
                           downloading: meal == nil)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.leading)
            .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))

            Spacer(minLength: 0)
        }
        .cardBackground()
        .onTapGesture {
            if let meal {
                recipePressed(meal)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.backgroundColor
            .ignoresSafeArea()

        RecipeCategoryCard(meal: Meal(strMeal: "Köttfärssås med spaghetti",
                                      strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
                                      idMeal: ""),
                           recipePressed: { _ in })
        .frame(width: 200)
    }
}
