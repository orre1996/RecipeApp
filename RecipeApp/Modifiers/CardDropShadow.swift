//
//  CardDropShadow.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import SwiftUI

struct CardDropShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.02), radius: 4, x: 0, y: 1)
            .shadow(color: .black.opacity(0.04), radius: 2, x: 0, y: 2)
    }
}

extension View {
    func cardDropShadow() -> some View {
        modifier(CardDropShadow())
    }
}
