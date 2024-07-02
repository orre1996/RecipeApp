//
//  CardBackground.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import SwiftUI

struct CardBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.cardBackground
                .cornerRadius(8)
                .cardDropShadow()
            )
    }
}

extension View {
    func cardBackground() -> some View {
        modifier(CardBackground())
    }
}
