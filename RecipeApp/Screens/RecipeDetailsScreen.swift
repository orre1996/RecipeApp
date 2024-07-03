//
//  RecipeDetailsScreen.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import SwiftUI

struct RecipeDetailsScreen: View {
    @Environment(\.safeAreaInsets) private var safeAreaInsets

    @ObservedObject var viewModel: RecipeDetailsViewModel

    @State private var showNavigationBarBackground = false

    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.backgroundColor
                .ignoresSafeArea()

            GeometryReader { geometryProxy in
                ScrollView {
                    VStack(spacing: 0) {
                        headerView(geometryProxy: geometryProxy)

                        VStack(alignment: .leading, spacing: 16) {
                            if viewModel.showRecipeDetailsError {
                                ErrorCard()
                            } else {
                                instructionsView
                                
                                ingredientsView
                            }
                        }
                        .padding(16)
                    }
                    .background(GeometryReader {
                        Color.clear.preference(key: ScrollOffsetKey.self, value: -$0.frame(in: .named("scroll")).origin.y)
                    })
                    .onPreferenceChange(ScrollOffsetKey.self) {
                        showNavigationBarBackground = $0 + safeAreaInsets.top > geometryProxy.size.width
                    }
                }
                .refreshable {
                    await viewModel.getRecipeDetails()
                }
            }
            .ignoresSafeArea(edges: .top)

            RecipeDetailNavigationBar(title: viewModel.recipeDetails.strMeal, showNavigationBarBackground: showNavigationBarBackground)
        }
        .task {
          //  await viewModel.getRecipeDetails()
        }
    }

    @ViewBuilder
    private func headerView(geometryProxy: GeometryProxy) -> some View {
        ShimmeringImage(imageUrl: viewModel.recipeDetails.strMealThumb)
            .frame(width: geometryProxy.size.width, height: geometryProxy.size.width)
            .accessibilityHidden(true)

        ShimmeringText(text: viewModel.recipeDetails.strMeal,
                       font: .header(size: 20),
                       color: .cardTextColor,
                       downloading: false)
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.cardBackground
            .cardDropShadow()
        )
    }

    @ViewBuilder
    private var instructionsView: some View {
        Text("Instructions")
            .font(.header(size: 18))
            .foregroundStyle(Color.backgroundTextColor)
            .padding(.horizontal, 8)
            .accessibilityAddTraits(.isHeader)

        ShimmeringText(text: viewModel.recipeDetails.strInstructions,
                       font: .body(size: 16),
                       color: .cardTextColor,
                       downloading: viewModel.recipeDetails.strInstructions.isEmpty)
        .lineSpacing(4)
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .cardBackground()
    }

    @ViewBuilder
    private var ingredientsView: some View {
        Text("Ingredients")
            .font(.header(size: 18))
            .foregroundStyle(Color.backgroundTextColor)
            .padding(.horizontal, 8)
            .accessibilityAddTraits(.isHeader)

        RecipeDetailsIngredientList(ingredients: viewModel.recipeDetails.ingredients)
    }
}

extension RecipeDetailsScreen {
    static func create(meal: Meal) -> RecipeDetailsScreen {
        return RecipeDetailsScreen(viewModel: RecipeDetailsViewModel(meal: meal))
    }
}

#Preview {
    RecipeDetailsScreen(viewModel: RecipeDetailsViewModel(meal: Meal.emptyMeal()))
}
