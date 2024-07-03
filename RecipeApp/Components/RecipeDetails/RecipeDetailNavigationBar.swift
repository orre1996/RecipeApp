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
    
    let title: String
    let showNavigationBarBackground: Bool

    var body: some View {
        ZStack {
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
                
                Spacer()
            }

            Text(title)
                .font(.header(size: 18))
                .foregroundStyle(Color.cardTextColor)
                .opacity(showNavigationBarBackground ? 1 : 0)
                .padding(.horizontal, 80)
                .lineLimit(1)
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
        .background(showNavigationBarBackground ? Color.cardBackground : Color.clear)
        .animation(.default, value: showNavigationBarBackground)
        .cardDropShadow()
    }
}

#Preview {
    RecipeDetailNavigationBar(title: "Title", showNavigationBarBackground: false)
}
