//
//  RecipeDetailNavigationBar.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import SwiftUI

struct RecipeDetailNavigationBar: View {
    @ScaledMetric private var scale: CGFloat = 1

    @Environment(\.dismiss) var dismiss

    var body: some View {
        HStack {
            Button(action: {
                dismiss()
            }, label: {
                Image.chevronLeft
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20 * scale, height: 20 * scale)
                    .padding(12)
                    .background(Color.cardBackground)
                    .foregroundStyle(Color.red)
                    .clipShape(Circle())
            })
        }
    }
}

#Preview {
    RecipeDetailNavigationBar()
}
