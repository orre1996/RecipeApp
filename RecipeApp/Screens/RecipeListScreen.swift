//
//  ContentView.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import SwiftUI

struct RecipeListScreen: View {
    @StateObject var viewModel = RecipeCategoriesViewModel()

    @State private var searchInput = ""
    @State private var selectedMealItem = Meal.emptyMeal()
    @State private var navigateToDetailPage = false

    private let columns = [
        GridItem(.adaptive(minimum: 150, maximum: 400), spacing: 16)
    ]

    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()

            VStack(spacing: 16) {
                SearchField(text: $searchInput)
                    .padding(.top, 16)

                ScrollView {
                    if viewModel.recipes != nil {
                        populatedList
                    } else {
                        loadingList
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .task {
            await viewModel.getRecipeCategory(.dessert)
        }
        .navigate(to: RecipeDetailsScreen.create(meal: selectedMealItem), when: $navigateToDetailPage)
    }

    private var loadingList: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(0..<10, id: \.self) { _ in
                RecipeCategoryCard(meal: nil, recipePressed: { _ in })
            }
        }
        .padding(.bottom, 16)
    }

    @ViewBuilder
    private var populatedList: some View {
        let filteredRecipes = viewModel.recipes?.filter({ $0.strMeal.contains(searchInput) || searchInput.isEmpty }) ?? []

        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(filteredRecipes, id: \.self) { meal in
                let index = filteredRecipes.firstIndex(of: meal) ?? 0

                RecipeCategoryCard(meal: meal, recipePressed: { meal in
                    selectedMealItem = meal
                    navigateToDetailPage = true
                })
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("Recipe \(index + 1) out of \(filteredRecipes.count). \(meal.strMeal)")
            }
        }
        .animation(.default, value: filteredRecipes)
        .padding(.bottom, 16)
    }
}

#Preview {
    RecipeListScreen()
}
