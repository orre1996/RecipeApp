//
//  SearchField.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import SwiftUI

struct SearchField: View {
    @ScaledMetric private var scale: CGFloat = 1

    @Binding var text: String

    @State private var isEditing = false

    var body: some View {
        HStack(spacing: 8) {
            Image.magnifyingGlass
                .resizable()
                .frame(width: 16 * scale, height: 16 * scale)
                .foregroundStyle(text.isEmpty && !isEditing ? Color.placeholderColor : Color.cardTextColor)
                .accessibilityHidden(true)

            TextField("Search for recipe", text: $text, onEditingChanged: { isEditing in
                self.isEditing = isEditing
            })
            .placeholder(when: text.isEmpty) {
                Text("Search for recipe")
                    .foregroundStyle(Color.gray)
                    .accessibilityHidden(true)
            }
            .foregroundStyle(Color.cardTextColor)

            if !text.isEmpty {
                Button(action: {
                    text = ""
                }, label: {
                    Image.clear
                        .resizable()
                        .frame(width: 16 * scale, height: 16 * scale)
                        .foregroundColor(Color.cardTextColor)
                })
                .accessibilityLabel("Clear textfield")
            }
        }
        .padding(16)
        .background(Color.cardBackground
            .cornerRadius(8)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray)
                .allowsHitTesting(false)
        )
    }
}

#Preview {
    SearchField(text: .constant(""))
}
